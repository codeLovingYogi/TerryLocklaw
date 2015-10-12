from django.conf.urls import include, url
from . import views

urlpatterns = [
    url(r'^$', views.script_main),
    url(r'^contactus/$', views.contact_us, name='contact_us'),
    url(r'^thanks/$', views.thanks, name='thanks'),   
    url(r'^modeltest/$', views.model_test, name='model_test'),     
]