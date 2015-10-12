from django.shortcuts import render
from django.http import HttpResponseRedirect, HttpResponse
from django.core.mail import send_mail, BadHeaderError
from .forms import ContactForm
from django.utils import timezone
from .models import Episode


def script_main(request):
	return render(request,'videoscript/script_main.html',{})

def contact_us(request):
	if request.method == 'POST':
		form = ContactForm(request.POST)
		if form.is_valid():
			first_name = form.cleaned_data['first_name']
			last_name = form.cleaned_data['last_name']
			sender = form.cleaned_data['sender']
			subject = form.cleaned_data['subject']
			message = form.cleaned_data['message']
			cc_myself = form.cleaned_data['cc_myself']

			recipients = ['sendfelice@gmail.com']
			if cc_myself:
				recipients.append(sender)

			email_message =  'From: ' + first_name + ' ' + last_name + ' Email: ' + sender + ' Message: ' + message

			if subject and message and sender:
				try:
					message = email_message
					send_mail(subject, message, sender, recipients)
				except BadHeaderError:
					return HttpResponse('Invalid header found.')
				return HttpResponseRedirect('/thanks/')
	else:
		form = ContactForm()

	return render(request,'videoscript/contact_us.html',{'form': form})

def thanks(request):
	return render(request,'videoscript/thanks.html',{})

def model_test(request):
	episodes = Episode.objects.filter(added_date__lte=timezone.now()).order_by('added_date')
	return render(request,'videoscript/model_test.html',{'episodes': episodes})