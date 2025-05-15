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

# student visa inquery
class tbl_student_visa_inquiry(models.Model):
    RELATION_CHOICES = [
        ('Father', 'Father'),
        ('Spouse', 'Spouse'),
    ]

    relation = models.CharField(max_length=10, choices=RELATION_CHOICES)
    name = models.CharField(max_length=100)
    father_name = models.CharField(max_length=100)
    contact_number = models.CharField(max_length=15)
    landline_number = models.CharField(max_length=15, blank=True, null=True)
    alternate_number = models.CharField(max_length=15, blank=True, null=True)
    email = models.EmailField()
    date_of_birth = models.DateField()
    desired_country = models.CharField(max_length=50)
    present_occupation = models.CharField(max_length=50, null=True, blank=True)
    additional_query = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_student_visa_inquiry'

    def __str__(self):
        return f"{self.name}"


# PR visa inquery
class tbl_pr_visa_inquiry(models.Model):
    desired_country = models.CharField(max_length=50)
    desired_visa_route = models.CharField(max_length=50)
    relation = models.CharField(max_length=50)
    name = models.CharField(max_length=100)
    number = models.CharField(max_length=50)
    landline = models.CharField(max_length=50)
    alt_number = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    dob = models.DateTimeField()
    marital_status = models.CharField(max_length=50)
    no_of_child = models.CharField(max_length=50)
    flat_no = models.CharField(max_length=100)
    building_name = models.CharField(max_length=100)
    road_street = models.CharField(max_length=100)
    pincode = models.CharField(max_length=100)
    area = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    inquiry_id = models.CharField(max_length=100)
    resume = models.FileField(upload_to='resumes/')

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

class tbl_education_qualification(models.Model):
    inquiry_id = models.CharField(max_length=100)
    qualification = models.CharField(max_length=100)
    stream_of_degree = models.CharField(max_length=100)
    major_degree = models.CharField(max_length=100)
    year_of_completion = models.CharField(max_length=100)
    percentage = models.CharField(max_length=100)
    total_backlog = models.CharField(max_length=100)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_education_qualification'

    def __str__(self):
        return f"{self.inquiry_id}"

class tbl_employeement_detail(models.Model):
    inquiry_id = models.CharField(max_length=100)
    company = models.CharField(max_length=100)
    designation = models.CharField(max_length=100)
    from_date = models.CharField(max_length=100)
    to_date = models.CharField(max_length=100)
    no_of_years = models.CharField(max_length=100)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_employeement_detail'

    def __str__(self):
        return f"{self.inquiry_id}"

class tbl_exam_detail(models.Model):
    inquiry_id = models.CharField(max_length=100)
    exam = models.CharField(max_length=100)
    listening = models.CharField(max_length=100)
    reading = models.CharField(max_length=100)
    writing = models.CharField(max_length=100)
    speaking = models.CharField(max_length=100)
    final_score = models.CharField(max_length=100)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_exam_detail'

    def __str__(self):
        return f"{self.inquiry_id}"

class tbl_test_detail(models.Model):
    inquiry_id = models.CharField(max_length=100)
    exam = models.CharField(max_length=100)
    verbal_reasoning = models.CharField(max_length=100)
    quantitative_reasoning = models.CharField(max_length=100)
    analytical_writing = models.CharField(max_length=100)
    final_score = models.CharField(max_length=100)

    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'tbl_test_detail'

    def __str__(self):
        return f"{self.inquiry_id}"
