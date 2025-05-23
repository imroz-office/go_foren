# Generated by Django 3.2 on 2025-05-10 04:12

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0026_alter_tbl_visa_service_image_url'),
    ]

    operations = [
        migrations.RenameField(
            model_name='tbl_gallery',
            old_name='drive_url',
            new_name='image_id',
        ),
        migrations.RemoveField(
            model_name='tbl_about_founder',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_about_race',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_about_us',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_blog',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_blog',
            name='image2',
        ),
        migrations.RemoveField(
            model_name='tbl_blog',
            name='image3',
        ),
        migrations.RemoveField(
            model_name='tbl_courses',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_gallery',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_home',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_news',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_success_stories',
            name='image',
        ),
        migrations.RemoveField(
            model_name='tbl_team',
            name='image',
        ),
        migrations.AddField(
            model_name='tbl_about_founder',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_about_founder',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_about_race',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_about_race',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_about_us',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_about_us',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_id_2',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_id_3',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_url_2',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_blog',
            name='image_url_3',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_courses',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_courses',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_gallery',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_home',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_home',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_news',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_news',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_success_stories',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_success_stories',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_team',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
        migrations.AddField(
            model_name='tbl_team',
            name='image_url',
            field=models.CharField(max_length=500, null=True),
        ),
        migrations.AddField(
            model_name='tbl_visa_service',
            name='image_id',
            field=models.CharField(max_length=50, null=True),
        ),
    ]
