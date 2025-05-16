from django.db import models


# ========================= AUTHENTICATION ADMIN  =========================

# User table
class tbl_user(models.Model): 
    username = models.CharField(max_length=50, null=True)
    role = models.CharField(max_length=50, null=True)
    email = models.EmailField(max_length=254, unique=True)  
    mobile = models.CharField(max_length=15, unique=True)  
    password = models.CharField(max_length=128)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_user'

    def __str__(self):
        return self.username

# ========================= FOR FETCHING  =========================

# role table
class tbl_role(models.Model): 
    role = models.CharField(max_length=50, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_role'

    def __str__(self):
        return self.role

# country table
class tbl_country(models.Model): 
    country = models.CharField(max_length=50, null=True)
    about = models.CharField(max_length=50, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_country'

    def __str__(self):
        return self.country

# occupation table
class tbl_occupation(models.Model): 
    occupation = models.CharField(max_length=50, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_occupation'

    def __str__(self):
        return self.occupation

# ========================= FOR FRONTEND [GET]  =========================
# ========================= FOR FRONTEND [GET]  =========================
# ========================= FOR FRONTEND [GET]  =========================

# ========================= FOR HOME  =========================

# home table
class tbl_home(models.Model): 
    serial = models.IntegerField(default=1)
    heading = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    description = models.TextField(blank=True, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
    category = models.CharField(max_length=50, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_home'

    def __str__(self):
        return self.heading

# news table
class tbl_news(models.Model): 
    heading = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_news'

    def __str__(self):
        return self.heading
        
# team table
class tbl_team(models.Model): 
    name = models.CharField(max_length=50, null=True)
    tweeter = models.CharField(max_length=50, null=True)
    linkedin = models.CharField(max_length=50, null=True)
    facebook = models.CharField(max_length=50, null=True)
    designation = models.CharField(max_length=50, null=True)
    description = models.TextField(blank=True, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_team'

    def __str__(self):
        return self.name
        
# FAQ table
class tbl_faq(models.Model): 
    question = models.CharField(max_length=50, null=True)
    answer = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_faq'

    def __str__(self):
        return self.question


# ========================= FOR ABOUT US  =========================

# ABOUT US table
class tbl_about_us(models.Model): 
    serial = models.IntegerField(default=1)
    image_id = models.CharField(max_length=50, null=True)
    heading = models.CharField(max_length=50, null=True)
    category = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_about_us'

    def __str__(self):
        return self.heading
 
# # ABOUT RACE table
# class tbl_about_race(models.Model): 
#     serial = models.IntegerField(default=1)
#     heading = models.CharField(max_length=50, null=True)
#     image_url = models.CharField(max_length=500, null=True)
#     image_id = models.CharField(max_length=50, null=True)
#     # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
#     description = models.TextField(blank=True, null=True)
#     created_at = models.DateTimeField(auto_now_add=True)
#     updated_at = models.DateTimeField(auto_now=True)

#     class Meta:
#         db_table = 'tbl_about_race'

#     def __str__(self):
#         return self.heading
 
# # ABOUT Founder table
# class tbl_about_founder(models.Model): 
#     serial = models.IntegerField(default=1)
#     heading = models.CharField(max_length=50, null=True)
#     image_url = models.CharField(max_length=500, null=True)
#     image_id = models.CharField(max_length=50, null=True)
#     # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
#     description = models.TextField(blank=True, null=True)
#     created_at = models.DateTimeField(auto_now_add=True)
#     updated_at = models.DateTimeField(auto_now=True)

#     class Meta:
#         db_table = 'tbl_about_founder'

#     def __str__(self):
#         return self.heading
        
# ========================= FOR VISA SERVICES  =========================

# visa type table
class tbl_visa_service(models.Model): 
    visa_type = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    description = models.TextField(blank=True, null=True)
    # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'visa_type'

    def __str__(self):
        return self.visa_type

# ========================= FOR COURSES  =========================

# courses table
class tbl_courses(models.Model): 
    course_name = models.CharField(max_length=50, null=True)
    description = models.TextField(blank=True, null=True)
    description2 = models.TextField(blank=True, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_course/', null=True, default="other/default/default.jpeg")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_courses'

    def __str__(self):
        return self.course_name

# ========================= FOR MEDIA  =========================

# image table
class tbl_gallery(models.Model): 
    category = models.CharField(max_length=50,blank=True, null=True)
    image_name = models.CharField(max_length=50,blank=True, null=True)
    # drive_url = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_gallery/', null=True, default = "others/default/default.jpeg")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_gallery'

    def __str__(self):
        return self.image_name

# Video table
class tbl_video(models.Model): 
    video_name = models.CharField(max_length=50,blank=True, null=True)
    row_video_url = models.CharField(max_length=100, null=True)
    video_embed_url  = models.CharField(max_length=100, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_video'

    def __str__(self):
        return self.video_name
        
# success stories table
class tbl_success_stories(models.Model): 
    heading = models.CharField(max_length=50, null=True)
    post = models.CharField(max_length=50, null=True)
    image_url = models.CharField(max_length=500, null=True)
    description = models.TextField(blank=True, null=True)
    image_id = models.CharField(max_length=50, null=True)
    # image = models.ImageField(upload_to='img_visa/', null=True, default="other/default/default.jpeg")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_success_stories'

    def __str__(self):
        return self.heading

# ========================= FOR BLOGS  =========================

# Blogs table
class tbl_blog(models.Model): 
    heading = models.CharField(max_length=100, null=True)
    title = models.CharField(max_length=100, null=True)
    title2 = models.CharField(max_length=100, null=True)
    title3 = models.CharField(max_length=100, null=True)
    image_url = models.CharField(max_length=500, null=True)
    image_id = models.CharField(max_length=50, null=True)
    image_url_2 = models.CharField(max_length=500, null=True)
    image_id_2 = models.CharField(max_length=50, null=True)
    image_url_3 = models.CharField(max_length=500, null=True)
    image_id_3 = models.CharField(max_length=50, null=True)
    description = models.TextField(blank=True, null=True)
    description2 = models.TextField(blank=True, null=True)
    description3 = models.TextField(blank=True, null=True)
    
    # image = models.ImageField(upload_to='img_blogs/', null=True, default="other/default/default.jpeg")
    # image2 = models.ImageField(upload_to='img_blogs/', null=True, default="other/default/default.jpeg")
    # image3 = models.ImageField(upload_to='img_blogs/', null=True, default="other/default/default.jpeg")
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_blog'

    def __str__(self):
        return self.heading

# Blog comments table
class tbl_blog_comment(models.Model): 
    blog_id = models.IntegerField()
    name = models.CharField(max_length=100, null=True)
    email = models.CharField(max_length=100, null=True)
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_blog_comment'

    def __str__(self):
        return self.name



# ========================= FROM FRONTEND [POST]  =========================
# ========================= FROM FRONTEND [POST]  =========================
# ========================= FROM FRONTEND [POST]  =========================

# ========================= FOR CONTACT =========================

# Quick (visa) inquiry table
class visa_inquiry(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    number = models.CharField(max_length=15)
    desired_country = models.CharField(max_length=50, null=True)
    desired_visa_service = models.CharField(max_length=50, null=True)
    resume = models.FileField(upload_to='resumes/')
    interested_in_coaching = models.BooleanField(default=False)
    course = models.CharField(max_length=50, blank=True, null=True)
    message = models.TextField(blank=True, null=True)
    captcha_entered = models.CharField(max_length=20)  # Store what user typed
    created_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        db_table = 'visa_inquiry'

    def __str__(self):
        return f"{self.name} - {self.email}"

# tbl_cv table
class tbl_cv(models.Model):
    name = models.CharField(max_length=100)
    number = models.CharField(max_length=15)
    gender = models.CharField(max_length=15)
    desired_visa_service = models.CharField(max_length=50, null=True)
    resume = models.FileField(upload_to='resumes/')
    captcha_entered = models.CharField(max_length=20) 
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_cv'

    def __str__(self):
        return f"{self.name}"

# tbl_inquiry_association table
class tbl_inquiry_association(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField()
    number = models.CharField(max_length=15)
    present_occupation = models.CharField(max_length=50, null=True)
    additional_query = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_inquiry_association'

    def __str__(self):
        return f"{self.name}"

# PR visa inquery
class tbl_pr_visa_inquiry(models.Model):
    desired_country = models.CharField(max_length=50, null=True , blank=True)
    desired_visa_route = models.CharField(max_length=50, null=True , blank=True)
    relation = models.CharField(max_length=50, null=True , blank=True)
    name = models.CharField(max_length=100, null=True , blank=True)
    number = models.CharField(max_length=50, null=True , blank=True)
    landline = models.CharField(max_length=50, null=True , blank=True)
    alt_number = models.CharField(max_length=50, null=True , blank=True)
    email = models.CharField(max_length=50, null=True , blank=True)
    dob = models.DateTimeField(null=True , blank=True)
    marital_status = models.CharField(max_length=50, null=True , blank=True)
    no_of_child = models.CharField(max_length=50, null=True , blank=True)
    flat_no = models.CharField(max_length=100, null=True , blank=True)
    building_name = models.CharField(max_length=100, null=True , blank=True)
    road_street = models.CharField(max_length=100, null=True , blank=True)
    pincode = models.CharField(max_length=100, null=True , blank=True)
    area = models.CharField(max_length=100, null=True , blank=True)
    city = models.CharField(max_length=100, null=True , blank=True)
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    resume = models.FileField(upload_to='resumes/', null=True , blank=True)

    # education_qualification = models.CharField(max_length=100)
    # employeement_detail = models.CharField(max_length=100)
    # internal_exams = models.CharField(max_length=100)
    # admission_test = models.CharField(max_length=100)
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_pr_visa_inquiry'

    def __str__(self):
        return f"{self.name}"
    
# common for student visa PR visa
class tbl_education_qualification(models.Model):
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    qualification = models.CharField(max_length=100, null=True , blank=True)
    stream_of_degree = models.CharField(max_length=100, null=True , blank=True)
    major_degree = models.CharField(max_length=100, null=True , blank=True)
    year_of_completion = models.CharField(max_length=100, null=True , blank=True)
    percentage = models.CharField(max_length=100, null=True , blank=True)
    total_backlog = models.CharField(max_length=100, null=True , blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_education_qualification'

    def __str__(self):
        return f"{self.inquiry_id}"

# common for student visa PR visa
class tbl_employeement_detail(models.Model): 
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    company = models.CharField(max_length=100, null=True , blank=True)
    designation = models.CharField(max_length=100, null=True , blank=True)
    from_date = models.CharField(max_length=100, null=True , blank=True)
    to_date = models.CharField(max_length=100, null=True , blank=True)
    no_of_years = models.CharField(max_length=100, null=True , blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_employeement_detail'

    def __str__(self):
        return f"{self.inquiry_id}"

# common for student visa PR visa
class tbl_exam_detail(models.Model):
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    exam = models.CharField(max_length=100, null=True , blank=True)
    listening = models.CharField(max_length=100, null=True , blank=True)
    reading = models.CharField(max_length=100, null=True , blank=True)
    writing = models.CharField(max_length=100, null=True , blank=True)
    speaking = models.CharField(max_length=100, null=True , blank=True)
    final_score = models.CharField(max_length=100, null=True , blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_exam_detail'

    def __str__(self):
        return f"{self.inquiry_id}"

# common for student visa PR visa
class tbl_test_detail(models.Model):
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    exam = models.CharField(max_length=100, null=True , blank=True)
    verbal_reasoning = models.CharField(max_length=100, null=True , blank=True)
    quantitative_reasoning = models.CharField(max_length=100, null=True , blank=True)
    analytical_writing = models.CharField(max_length=100, null=True , blank=True)
    final_score = models.CharField(max_length=100, null=True , blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_test_detail'

    def __str__(self):
        return f"{self.inquiry_id}"

# student visa inquery
class tbl_student_visa_inquiry(models.Model):
    relation = models.CharField(max_length=50, blank=True, null=True)
    name = models.CharField(max_length=100, blank=True, null=True)
    father_name = models.CharField(max_length=100, blank=True, null=True)
    contact_number = models.CharField(max_length=15, blank=True, null=True)
    landline_number = models.CharField(max_length=15, blank=True, null=True)
    alternate_number = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField(blank=True, null=True)
    date_of_birth = models.DateField(blank=True, null=True)
    desired_country = models.CharField(max_length=50, blank=True, null=True)
    spouse_dependent_visa = models.CharField(max_length=50, blank=True, null=True)

    flat_no = models.CharField(max_length=50, blank=True, null=True)
    building_name = models.CharField(max_length=50, blank=True, null=True)
    road_street = models.CharField(max_length=50, blank=True, null=True)
    pincode = models.CharField(max_length=50, blank=True, null=True)
    area = models.CharField(max_length=50, blank=True, null=True)
    city = models.CharField(max_length=50, blank=True, null=True)
    
    field_of_study = models.CharField(max_length=100, blank=True, null=True)
    level_of_study = models.CharField(max_length=100, blank=True, null=True)
    
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    resume = models.FileField(upload_to='resumes/', null=True , blank=True)

    # education_qualification = models.CharField(max_length=100)
    # employeement_detail = models.CharField(max_length=100)
    # internal_exams = models.CharField(max_length=100)
    # admission_test = models.CharField(max_length=100)
    # intended_study = models.CharField(max_length=100)
  
    is_valid_passport = models.CharField(max_length=100, blank=True, null=True)
    citizenship = models.CharField(max_length=100, blank=True, null=True)
    passport_no = models.CharField(max_length=100, blank=True, null=True)
    father_occupation = models.CharField(max_length=100, blank=True, null=True)
    family_income = models.CharField(max_length=100, blank=True, null=True)
    blood_relative_foreign = models.CharField(max_length=100, blank=True, null=True)
    countries_names = models.CharField(max_length=100, blank=True, null=True)
    how_about_us = models.CharField(max_length=100, blank=True, null=True)
    additional_query = models.TextField(blank=True, null=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_student_visa_inquiry'

    def __str__(self):
        return f"{self.name}"

# for only student visa 
class tbl_intended_study(models.Model):
    inquiry_id = models.CharField(max_length=100, null=True , blank=True)
    month = models.CharField(max_length=100, null=True , blank=True)
    year = models.CharField(max_length=100, null=True , blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_intended_study'

    def __str__(self):
        return f"{self.inquiry_id}"

 