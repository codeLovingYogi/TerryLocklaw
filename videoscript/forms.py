from django import forms

class ContactForm(forms.Form):
	first_name = forms.CharField()
	last_name = forms.CharField()
	sender = forms.EmailField()
	subject = forms.CharField(max_length=100)
	message = forms.CharField(widget=forms.Textarea)
	cc_myself = forms.BooleanField(required=False)
