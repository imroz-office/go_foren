# Generated by Django 3.2 on 2025-05-08 06:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0011_tbl_blog_tbl_cv'),
    ]

    operations = [
        migrations.CreateModel(
            name='tbl_inquiry_association',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('email', models.EmailField(max_length=254)),
                ('number', models.CharField(max_length=15)),
                ('present_occupation', models.CharField(choices=[('Travel Agent', 'Travel Agent'), ('IELTS Trainee', 'IELTS Trainee'), ('Visa Service Agent', 'Visa Service Agent'), ('OTHER', 'OTHER')], max_length=50)),
                ('additional_query', models.TextField(blank=True, null=True)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('updated_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'tbl_inquiry_association',
            },
        ),
    ]
