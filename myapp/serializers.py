# serializers.py

from rest_framework import serializers
from .models import *


class HomeSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_home
        fields = '__all__'


class CourseSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_courses
        fields = '__all__'


class GallerySerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_gallery
        fields = '__all__'


class VideoSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_video
        fields = '__all__'


class SuccessStorySerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_success_stories
        fields = '__all__'


class BlogSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_blog
        fields = '__all__'

class VisaServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_visa_service
        fields = '__all__'

class AboutUsSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_about_us
        fields = '__all__'


class TeamSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_team
        fields = '__all__'


class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_news
        fields = '__all__'


class CountrySerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_country
        fields = '__all__'

class OccupationSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_occupation
        fields = '__all__'

class FaqSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_faq
        fields = '__all__'

class BlogCommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_blog_comment
        fields = '__all__'

class PersonalizedGuidanceSerializer(serializers.ModelSerializer):
    class Meta:
        model = PersonalizedGuidance
        fields = '__all__'

class StudyFacultySerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_course_name
        fields = '__all__'

class StudyLevelSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_study_level
        fields = '__all__'

class IndustryTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_industry_type
        fields = '__all__'

class VacancySerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_vacancy
        fields = '__all__'

class StudyCourceSerializer(serializers.ModelSerializer):
    class Meta:
        model = tbl_study_course
        fields = '__all__'