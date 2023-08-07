# Generated by Django 4.1 on 2023-08-05 20:44

import django.core.validators
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('alumni', '0007_category_description_alter_higherstudies_degree_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alumni',
            name='name',
            field=models.CharField(max_length=100, null=True, validators=[django.core.validators.RegexValidator('[+-/%@$^&*()!:;]', inverse_match=True)]),
        ),
    ]