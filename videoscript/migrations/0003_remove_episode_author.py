# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('videoscript', '0002_episode_author'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='episode',
            name='author',
        ),
    ]
