# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Episode',
            fields=[
                ('id', models.AutoField(auto_created=True, serialize=False, primary_key=True, verbose_name='ID')),
                ('title', models.CharField(max_length=200)),
                ('script', models.TextField()),
                ('added_date', models.DateTimeField(default=django.utils.timezone.now)),
                ('aired_date', models.DateTimeField(null=True, blank=True)),
            ],
        ),
    ]
