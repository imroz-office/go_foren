from django.urls import path
from . import views

urlpatterns = [
    # ======================= Authentication and User =======================
    
    # rendering
    path('', views.open_sign_in_page, name='open_sign_in_page'),
    path('dashboard_view/', views.dashboard_view, name='dashboard_view'),
    path('login/', views.login, name='login'),
    path('logout/', views.log_out_page, name='logout'),
    
    # user
    path('add_user/', views.add_user, name='add_user'),
    path('user_list/', views.user_list, name='user_list'),
    path('user_view/<int:id>', views.user_view, name='user_view'),
    path('edit_user/<int:id>', views.edit_user, name='edit_user'),
    path('delete_user/<int:id>', views.delete_user, name='delete_user'),

    # ======================= Master =======================
    
    # country
    path('add_country/', views.add_country, name='add_country'),
    path('country_list/', views.country_list, name='country_list'),
    path('country_view/<int:id>', views.country_view, name='country_view'),
    path('edit_country/<int:id>', views.edit_country, name='edit_country'),
    path('delete_country/<int:id>', views.delete_country, name='delete_country'),
    
    # course
    path('add_course/', views.add_course, name='add_course'),
    path('course_list/', views.course_list, name='course_list'),
    path('course_view/<int:id>', views.course_view, name='course_view'),
    path('edit_course/<int:id>', views.edit_course, name='edit_course'),
    path('delete_course/<int:id>', views.delete_course, name='delete_course'),
    
    # visa_type
    path('add_visa_type/', views.add_visa_type, name='add_visa_type'),
    path('visa_type_list/', views.visa_type_list, name='visa_type_list'),
    path('visa_type_view/<int:id>', views.visa_type_view, name='visa_type_view'),
    path('edit_visa_type/<int:id>', views.edit_visa_type, name='edit_visa_type'),
    path('delete_visa_type/<int:id>', views.delete_visa_type, name='delete_visa_type'),
    
    # role
    path('add_role/', views.add_role, name='add_role'),
    path('role_list/', views.role_list, name='role_list'),
    path('edit_role/<int:id>', views.edit_role, name='edit_role'),
    path('delete_role/<int:id>', views.delete_role, name='delete_role'),
   
    # occupation
    path('add_occupation/', views.add_occupation, name='add_occupation'),
    path('occupation_list/', views.occupation_list, name='occupation_list'),
    path('occupation_view/<int:id>', views.occupation_view, name='occupation_view'),
    path('edit_occupation/<int:id>', views.edit_occupation, name='edit_occupation'),
    path('delete_occupation/<int:id>', views.delete_occupation, name='delete_occupation'),

    # ======================= Media =======================
    
    # image
    path('add_image/', views.add_image, name='add_image'),
    path('image_list/', views.image_list, name='image_list'),
    path('image_view/<int:id>', views.image_view, name='image_view'),
    path('edit_image/<int:id>', views.edit_image, name='edit_image'),
    path('delete_image/<int:id>', views.delete_image, name='delete_image'),
    
    # video
    path('add_video/', views.add_video, name='add_video'),
    path('video_list/', views.video_list, name='video_list'),
    path('video_view/<int:id>', views.video_view, name='video_view'),
    path('edit_video/<int:id>', views.edit_video, name='edit_video'),
    path('delete_video/<int:id>', views.delete_video, name='delete_video'),
    
    # success_story
    path('add_success_story/', views.add_success_story, name='add_success_story'),
    path('success_story_list/', views.success_story_list, name='success_story_list'),
    path('success_story_view/<int:id>', views.success_story_view, name='success_story_view'),
    path('edit_success_story/<int:id>', views.edit_success_story, name='edit_success_story'),
    path('delete_success_story/<int:id>', views.delete_success_story, name='delete_success_story'),

    # ======================= Home =======================
    
    # home
    path('add_home/', views.add_home, name='add_home'),
    path('home_list/', views.home_list, name='home_list'),
    path('home_view/<int:id>', views.home_view, name='home_view'),
    path('edit_home/<int:id>', views.edit_home, name='edit_home'),
    path('delete_home/<int:id>', views.delete_home, name='delete_home'),
    
    # news
    path('add_news/', views.add_news, name='add_news'),
    path('news_list/', views.news_list, name='news_list'),
    path('news_view/<int:id>', views.news_view, name='news_view'),
    path('edit_news/<int:id>', views.edit_news, name='edit_news'),
    path('delete_news/<int:id>', views.delete_news, name='delete_news'), 
    
    # team
    path('add_team/', views.add_team, name='add_team'),
    path('team_list/', views.team_list, name='team_list'),
    path('team_view/<int:id>', views.team_view, name='team_view'),
    path('edit_team/<int:id>', views.edit_team, name='edit_team'),
    path('delete_team/<int:id>', views.delete_team, name='delete_team'),
    
    # faq
    path('add_faq/', views.add_faq, name='add_faq'),
    path('faq_list/', views.faq_list, name='faq_list'),
    path('faq_view/<int:id>', views.faq_view, name='faq_view'),
    path('edit_faq/<int:id>', views.edit_faq, name='edit_faq'),
    path('delete_faq/<int:id>', views.delete_faq, name='delete_faq'),
    
    # ======================= About US =======================
    
    # about_us 
    path('add_about_us/', views.add_about_us, name='add_about_us'),
    path('about_us_list/', views.about_us_list, name='about_us_list'),
    path('about_us_view/<int:id>', views.about_us_view, name='about_us_view'),
    path('edit_about_us/<int:id>', views.edit_about_us, name='edit_about_us'),
    path('delete_about_us/<int:id>', views.delete_about_us, name='delete_about_us'),

    # ======================= Blog =======================

    # blog
    path('add_blog/', views.add_blog, name='add_blog'),
    path('blog_list/', views.blog_list, name='blog_list'),
    path('blog_view/<int:id>', views.blog_view, name='blog_view'),
    path('edit_blog/<int:id>', views.edit_blog, name='edit_blog'),
    path('delete_blog/<int:id>', views.delete_blog, name='delete_blog'),
    

    # comments
    path('add_comments/', views.add_comments, name='add_comments'),
    path('comments_list/', views.comments_list, name='comments_list'),
    path('edit_comments/<int:id>', views.edit_comments, name='edit_comments'),
    path('delete_comments/<int:id>', views.delete_comments, name='delete_comments'),
    
    # ======================= Contact Us =======================
    
    # visa inquiry (contact, visitor visa, investor Visa, WP visa)
    path('visa-inquiry/', views.submit_visa_inquiry, name='visa_inquiry'),
    path('inquiry_view/', views.inquiry_view, name='inquiry_view'),
    path('inq_detail/<int:id>', views.inq_detail, name='inq_detail'),
    path('delete_inquiry/<int:id>', views.delete_inquiry, name='delete_inquiry'),

    # submit pr visa inquiry
    path('submit-pr-visa-inquiry/', views.submit_pr_visa_inquiry, name='submit_pr_visa_inquiry'),

   

    # ======================= [GET type API] =======================
    path('get_course_data/', views.get_course_data, name='get_course_data'),
    path('get_gallery_data/', views.get_gallery_data, name='get_gallery_data'),
    path('get_video_data/', views.get_video_data, name='get_video_data'),
    path('get_success_stories/', views.get_success_stories, name='get_success_stories'),
    path('get_blog_data/', views.get_blog_data, name='get_blog_data'),
    path('get_visa_services/', views.get_visa_services, name='get_visa_services'),
    path('get_team_data/', views.get_team_data, name='get_team_data'),
    path('get_news_data/', views.get_news_data, name='get_news_data'),
    
    path('get_home_data/', views.get_home_data, name='get_home_data'),
    path('get_about_us_data/', views.get_about_us_data, name='get_about_us_data'),
    path('get_country_data/', views.get_country_data, name='get_country_data'),
    path('get_occupation_data/', views.get_occupation_data, name='get_occupation_data'),
    path('get_faq_data/', views.get_faq_data, name='get_faq_data'),


    # ======================= [GET type API (detail)] =======================
    path('get_success_story_detail/<int:id>', views.get_success_story_detail, name='get_success_story_detail'),
    path('get_course_detail/<int:id>', views.get_course_detail, name='get_course_detail'),
    path('get_gallery_image_detail/<int:id>', views.get_gallery_image_detail, name='get_gallery_image_detail'),
    path('get_video_detail/<int:id>', views.get_video_detail, name='get_success_story_detail'),
    path('get_success_story_detail/<int:id>', views.get_success_story_detail, name='get_success_story_detail'),
    path('get_blog_detail/<int:id>', views.get_blog_detail, name='get_blog_detail'),
    path('get_news_detail/<int:id>', views.get_news_detail, name='get_news_detail'),
    path('get_team_detail/<int:id>', views.get_team_detail, name='get_team_detail'),
    path('get_visa_service_detail/<int:id>', views.get_visa_service_detail, name='get_visa_service_detail'),
    

]
