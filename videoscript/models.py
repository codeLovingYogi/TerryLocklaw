from django.db import models
from django.utils import timezone

class Episode(models.Model):
	title = models.CharField(max_length=200)
	script = models.TextField()
	added_date = models.DateTimeField(default=timezone.now)
	aired_date = models.DateTimeField(blank=True, null=True)
	author = models.ForeignKey('auth.User')

	def air(self):
		self.aired_date = timezone.now()
		self.save()

	def __str__(self):
		return self.title

