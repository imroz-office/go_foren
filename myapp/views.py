from django.shortcuts import render, get_object_or_404, redirect
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from django.views.decorators.http import require_POST
from django.core.paginator import Paginator
from .models import *
from django.http import JsonResponse
from .serializers import *
import uuid
import json

# ============================================================ Decorator & Utility Function ============================================================
 
def login_required_custom(view_func):
    def wrapper(request, *args, **kwargs):
        if 'user_id' not in request.session:
            return redirect('open_sign_in_page')
        return view_func(request, *args, **kwargs)
    return wrapper

def get_all_country():
    countries = tbl_country.objects.all().order_by("country")
    return countries

def get_all_occupation():
    occupation = tbl_occupation.objects.all().order_by("occupation")
    return occupation

def get_all_course():
    course = tbl_courses.objects.all().order_by("course")
    return course

def get_all_team():
    team = tbl_team.objects.all().order_by("name")
    return team
    
def get_all_visa_type():
    visa_type = tbl_visa_service.objects.all().order_by("visa_type")
    return visa_type
    
def get_all_role():
    roles = tbl_role.objects.all().order_by("role")
    return roles
    
def extract_drive_id(url):
    if "https://drive.google.com/file/d/" in url:
        return url.split("/d/")[1].split("/view")[0]
    return None

from urllib.parse import urlparse, parse_qs

def get_youtube_embed_url(url):
    try:
        if "youtu.be" in url:
            return "https://www.youtube.com/embed/" + url.split("/")[-1].split("?")[0]
        elif "youtube.com/watch" in url:
            video_id = parse_qs(urlparse(url).query).get("v", [None])[0]
            if video_id:
                return "https://www.youtube.com/embed/" + video_id
    except:
        pass
    return None

# ============================================================ Authentication and User ============================================================

def open_sign_in_page(request):
    """Render login page."""
    return render(request, "sign-in.html")

def login(request):
    """Handle login logic."""
    if request.method == 'POST':
        mobile = request.POST.get('mobile')
        password = request.POST.get('password')

        try:
            user = tbl_user.objects.get(mobile=mobile)

            if user.password == password:
                request.session['user_id'] = user.id
                request.session['session_username'] = user.username
                request.session['session_mobile'] = user.mobile
                request.session['session_email'] = user.email
                return redirect('dashboard_view')
            else:
                return render(request, "sign-in.html", {'incorrect_password': True})

        except tbl_user.DoesNotExist:
            return render(request, "sign-in.html", {'user_not_valid': True})

    return render(request, "sign-in.html")

def log_out_page(request):
    """Log out the user and clear session."""
    request.session.flush()
    return redirect('open_sign_in_page')

# --- Dashboard View ---

@login_required_custom
def dashboard_view(request):
    """Render the dashboard for logged-in users."""
    all_inq = visa_inquiry.objects.all().order_by("-id")
    inquiry_count = all_inq.count()
    
    context = {
        "inquiry_count":inquiry_count,
    }
    return render(request, "dashboard.html", context)

# user

@login_required_custom
def add_user(request):
    roles = get_all_role()

    if request.method == "POST":
        username = request.POST.get("username").strip().title()
        role = request.POST.get("role")
        email = request.POST.get("email").strip().lower()
        mobile = request.POST.get("mobile").strip()
        password = request.POST.get("password").strip()

        if tbl_user.objects.filter(mobile=mobile).exists():
            return JsonResponse({"status": "error", "message": "Mobile number already exists."})
        if tbl_user.objects.filter(email=email).exists():
            return JsonResponse({"status": "error", "message": "Email already exists."})

        tbl_user.objects.create(
            username=username,
            role=role,
            email=email,
            mobile=mobile,
            password=password,
        )
        return JsonResponse({"status": "success", "message": "User added successfully."})

    return render(request, "user-form.html", {"roles": roles})

@login_required_custom
def user_list(request):
    user_queryset = tbl_user.objects.all().exclude(role='System Admin').order_by("-id")

    paginator = Paginator(user_queryset, 10)  # Show 10 users per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "User",
        "data": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "user-list.html", context)

@login_required_custom
def user_view(request, id):
    data = get_object_or_404(tbl_user, id=id)
    context = {
        "data":data,
    }
    return render(request, "user-view.html", context)

@login_required_custom
def edit_user(request, id):
    roles = get_all_role()
    data = get_object_or_404(tbl_user, id=id)

    if request.method == "POST":
        username = request.POST.get("username").strip().title()
        role = request.POST.get("role")
        email = request.POST.get("email").strip().lower()
        mobile = request.POST.get("mobile").strip()
        password = request.POST.get("password").strip()

        if tbl_user.objects.exclude(id=data.id).filter(email=email).exists():
            return JsonResponse({"status": "error", "message": "Email already exists."})
        if tbl_user.objects.exclude(id=data.id).filter(mobile=mobile).exists():
            return JsonResponse({"status": "error", "message": "Mobile number already exists."})

        data.username = username
        data.role = role
        data.email = email
        data.mobile = mobile
        data.password = password
        data.save()

        return JsonResponse({"status": "success", "message": "User updated successfully."})

    context = {
        "roles": roles,
        "data": data,
        "is_edit": True,
    }
    return render(request, "user-form.html", context)
    
@login_required_custom
def delete_user(request, id):
    data = get_object_or_404(tbl_user, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('user_list')

# ============================================================ Master ============================================================

# country

@login_required_custom
def add_country(request):
    if request.method == "POST":
        country = request.POST.get("country")
        
        tbl_country.objects.create(
            country = country
            )
        request.session["add_success"] = True
        return redirect(country_list)
    return render(request, "country-form.html")

@login_required_custom
def country_list(request):
    country_queryset = tbl_country.objects.all().order_by("country")

    paginator = Paginator(country_queryset, 10)  # 10 countries per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Country",
        "countries": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "country-list.html", context)

@login_required_custom
def country_view(request, id):
    data = get_object_or_404(tbl_country, id=id)
    context = {
        "data":data,
    }
    return render(request, "country-view.html", context)

@login_required_custom
def edit_country(request, id):
    country = get_object_or_404(tbl_country, id=id)
    
    if request.method == "POST":
        new_name = request.POST.get("country")
        country.country = new_name
        country.save()
        request.session["update_success"] = True
        return redirect('country_list')  # Make sure 'country_list' is a valid URL name

    context = {
        "country": country,
        "is_edit": True,
    }
    return render(request, "country-form.html", context)
    
@login_required_custom
def delete_country(request, id):
    country = get_object_or_404(tbl_country, id=id)
    country.delete()
    request.session["delete_success"] = True
    return redirect('country_list')  # Again, ensure 'country_list' is the correct URL name

# course

@login_required_custom
def add_course(request):
    if request.method == "POST":
        course_name = request.POST.get("course_name")
        image_url = request.POST.get("image_url")
        description = request.POST.get("description")
        description2 = request.POST.get("description2")
        image_id = extract_drive_id(image_url)
        
        tbl_courses.objects.create(
            course_name = course_name,
            image_url = image_url,
            description = description,
            description2 = description2,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(course_list)
    return render(request, "course-form.html")

@login_required_custom
def course_list(request):
    course_queryset = tbl_courses.objects.all().order_by("course_name")

    # Pagination setup
    paginator = Paginator(course_queryset, 10)  # Show 10 courses per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Course",
        "page_obj": page_obj,
        # "search_query": search_query,
        "countries": page_obj.object_list,
    }
    return render(request, "course-list.html", context)
    
@login_required_custom
def course_view(request, id):
    data = get_object_or_404(tbl_courses, id=id)
    context = {
        "data":data,
    }
    return render(request, "course-view.html", context)

@login_required_custom
def edit_course(request, id):
    course = get_object_or_404(tbl_courses, id=id)
    
    if request.method == "POST":
        course.course_name = request.POST.get("course_name")
        course.image_url = request.POST.get("image_url")
        course.description = request.POST.get("description")
        course.description2 = request.POST.get("description2")
        course.image_id = extract_drive_id(course.image_url)
        
        course.save()
        request.session["update_success"] = True
        return redirect('course_list')

    context = {
        "course": course,
        "is_edit": True,
    }
    return render(request, "course-form.html", context)
    
@login_required_custom
def delete_course(request, id):
    course = get_object_or_404(tbl_courses, id=id)
    course.delete()
    request.session["delete_success"] = True
    return redirect('course_list')

# visa_type

@login_required_custom
def add_visa_type(request):
    if request.method == "POST":
        image_url = request.POST.get("image_url")
        visa_type = request.POST.get("visa_type")
        description = request.POST.get("description")
        image_id = extract_drive_id(image_url)

        tbl_visa_service.objects.create(
            visa_type = visa_type,
            description = description,
            image_url = image_url,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(visa_type_list)
    return render(request, "visa_type-form.html")

@login_required_custom
def visa_type_list(request):
    visa_type_queryset = tbl_visa_service.objects.all().order_by("visa_type")

    paginator = Paginator(visa_type_queryset, 10)  # 10 entries per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Visa Type",
        "visa_type": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "visa_type-list.html", context)

@login_required_custom
def visa_type_view(request, id):
    data = get_object_or_404(tbl_visa_service, id=id)
    context = {
        "data":data,
    }
    return render(request, "visa_type-view.html", context)

@login_required_custom
def edit_visa_type(request, id):
    visa_type = get_object_or_404(tbl_visa_service, id=id)
    
    if request.method == "POST":
        visa_type.image_url = request.POST.get("image_url")
        visa_type.visa_type = request.POST.get("visa_type")
        visa_type.description = request.POST.get("description")
        visa_type.image_id = extract_drive_id(visa_type.image_url)

        visa_type.save()
        request.session["update_success"] = True
        return redirect('visa_type_list') 
        
    context = {
        "visa_type": visa_type,
        "is_edit": True,
    }
    return render(request, "visa_type-form.html", context)
    
@login_required_custom
def delete_visa_type(request, id):
    visa_type = get_object_or_404(tbl_visa_service, id=id)
    visa_type.delete()
    request.session["delete_success"] = True
    return redirect('visa_type_list') 
    
# role

@login_required_custom
def add_role(request):
    if request.method == "POST":
        role = request.POST.get("role").strip().title()
        tbl_role.objects.create(
            role = role
            )
        request.session["add_success"] = True
        return redirect(role_list)
    return render(request, "role-form.html")

@login_required_custom
def role_list(request):
    role = tbl_role.objects.all().order_by("role")
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,    
        "record_name": "role",    
        "role":role,
    }
    return render(request, "role-list.html", context)

@login_required_custom
def edit_role(request, id):
    role = get_object_or_404(tbl_role, id=id)
    
    if request.method == "POST":
        role_ = request.POST.get("role").strip().title()
        role.role = role_
        role.save()
        request.session["update_success"] = True
        return redirect('role_list') 

    context = {
        "role": role,
        "is_edit": True,
    }
    return render(request, "role-form.html", context)
    
@login_required_custom
def delete_role(request, id):
    role = get_object_or_404(tbl_role, id=id)
    role.delete()
    request.session["delete_success"] = True
    return redirect('role_list')  # Again, ensure 'image_list' is the correct URL name

# occupation

@login_required_custom
def add_occupation(request):
    if request.method == "POST":
        occupation = request.POST.get("occupation").title()
                
        tbl_occupation.objects.create(
            occupation = occupation,
            )
        request.session["add_success"] = True
        return redirect(occupation_list)
    return render(request, "occupation-form.html")
    
@login_required_custom
def occupation_list(request):
    occupation_queryset = tbl_occupation.objects.all().order_by("occupation")

    paginator = Paginator(occupation_queryset, 10)  # 10 occupations per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Occupation",
        "occupations": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "occupation-list.html", context)

@login_required_custom
def occupation_view(request, id):
    data = get_object_or_404(tbl_occupation, id=id)
    context = {
        "data":data,
    }
    return render(request, "occupation-view.html", context)

@login_required_custom
def edit_occupation(request, id):
    data = get_object_or_404(tbl_occupation, id=id)
    
    if request.method == "POST":
        data.occupation = request.POST.get("occupation").title()
        data.save()
        request.session["update_success"] = True
        return redirect('occupation_list')  
        
    context = {
        "occupation": data,
        "is_edit": True,
    }
    return render(request, "occupation-form.html", context)
    
@login_required_custom
def delete_occupation(request, id):
    data = get_object_or_404(tbl_occupation, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('occupation_list')  
    
# ============================================================ Media ============================================================

# image

@login_required_custom
def add_image(request):
    if request.method == "POST":
        image_url = request.POST['image_url']
        category = request.POST['category']
        image_name = request.POST['image_name']
        image_id = extract_drive_id(image_url)
        
        tbl_gallery.objects.create(
            image_url = image_url,
            category = category,
            image_name = image_name,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(image_list)
    return render(request, "image-form.html")

@login_required_custom
def image_list(request):
    image_queryset = tbl_gallery.objects.all().order_by("-id")
    
    paginator = Paginator(image_queryset, 10)  # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Image",
        "image": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "image-list.html", context)

@login_required_custom
def image_view(request, id):
    data = get_object_or_404(tbl_gallery, id=id)
    context = {
        "data":data,
    }
    return render(request, "image-view.html", context)

@login_required_custom
def edit_image(request, id):
    image = get_object_or_404(tbl_gallery, id=id)
    
    if request.method == "POST":
        image.image_url = request.POST['image_url']
        image.category = request.POST['category']
        image.image_name = request.POST['image_name']
        image.image_id = extract_drive_id(image.image_url)
        image.save()
        request.session["update_success"] = True
        return redirect('image_list')  # Make sure 'image_list' is a valid URL name

    context = {
        "image": image,
        "is_edit": True,
    }
    return render(request, "image-form.html", context)
    
@login_required_custom
def delete_image(request, id):
    image = get_object_or_404(tbl_gallery, id=id)
    image.delete()
    request.session["delete_success"] = True
    return redirect('image_list')

# Video

@login_required_custom
def add_video(request):
    if request.method == "POST":
        video_name = request.POST.get("video_name")
        row_video_url = request.POST.get("video_url")
        video_embed_url = get_youtube_embed_url(row_video_url)
        tbl_video.objects.create(
            video_name = video_name,
            row_video_url = row_video_url,
            video_embed_url = video_embed_url,
            )
        request.session["add_success"] = True
        return redirect(video_list)
    return render(request, "video-form.html")

@login_required_custom
def video_list(request):
    video_queryset = tbl_video.objects.all().order_by("-id")
    
    paginator = Paginator(video_queryset, 10)  # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Video",
        "videos": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "video-list.html", context)

@login_required_custom
def video_view(request, id):
    data = get_object_or_404(tbl_video, id=id)
    context = {
        "data":data,
    }
    return render(request, "video-view.html", context)

@login_required_custom
def edit_video(request, id):
    video = get_object_or_404(tbl_video, id=id)
    
    if request.method == "POST":
        video.video_name = request.POST.get("video_name")
        video.row_video_url = request.POST.get("video_url")
        video.video_embed_url = get_youtube_embed_url(video.row_video_url)
        video.save()
        request.session["update_success"] = True
        return redirect('video_list')

    context = {
        "video": video,
        "is_edit": True,
    }
    return render(request, "video-form.html", context)
    
@login_required_custom
def delete_video(request, id):
    video = get_object_or_404(tbl_video, id=id)
    video.delete()
    request.session["delete_success"] = True
    return redirect('video_list')

# success_story

@login_required_custom
def add_success_story(request):
    if request.method == "POST":
        heading = request.POST.get("heading")
        post = request.POST.get("post")
        image_url = request.POST.get("image_url")
        description = request.POST.get("description")
        
        image_id = extract_drive_id(image_url)

        tbl_success_stories.objects.create(
            heading = heading,
            post = post,
            image_url = image_url,
            image_id = image_id,
            description = description,
        )
        request.session["add_success"] = True
        return redirect(success_story_list)
    return render(request, "success-story-form.html")

@login_required_custom
def success_story_list(request):
    story_queryset = tbl_success_stories.objects.all().order_by("-id")
    
    paginator = Paginator(story_queryset, 10)  # Show 10 stories per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Success story",
        "story": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "success-story-list.html", context)

@login_required_custom
def success_story_view(request, id):
    data = get_object_or_404(tbl_success_stories, id=id)
    context = {
        "data":data,
    }
    return render(request, "success-story-view.html", context)

@login_required_custom
def edit_success_story(request, id):
    story = get_object_or_404(tbl_success_stories, id=id)
    
    if request.method == "POST":
        story.heading = request.POST.get("heading")
        story.post = request.POST.get("post")
        story.image_url = request.POST.get("image_url")
        story.description = request.POST.get("description")
        story.image_id = extract_drive_id(story.image_url)
        
        story.save()
        request.session["update_success"] = True
        return redirect('success_story_list') 

    context = {
        "story": story,
        "is_edit": True,
    }
    return render(request, "success-story-form.html", context)
    
@login_required_custom
def delete_success_story(request, id):
    story = get_object_or_404(tbl_success_stories, id=id)
    story.delete()
    request.session["delete_success"] = True
    return redirect('success_story_list')

# ============================================================ Home ============================================================

# home

@login_required_custom
def add_home(request):
    if request.method == "POST":
        serial = request.POST.get("serial")
        heading = request.POST.get("heading")
        image_url = request.POST.get("image_url")
        description = request.POST.get("description")
        image_id = extract_drive_id(image_url)
        if not serial:
            serial = 1
        tbl_home.objects.create(
            serial = serial,
            heading = heading,
            image_url = image_url,
            description = description,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(home_list)
    return render(request, "home-form.html")

@login_required_custom
def home_list(request):
    home_queryset = tbl_home.objects.all().order_by("serial")
    
    paginator = Paginator(home_queryset, 10) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Home Content",
        "data": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "home-list.html", context)
    
@login_required_custom
def home_view(request, id):
    data = get_object_or_404(tbl_home, id=id)
    context = {
        "data":data,
    }
    return render(request, "home-view.html", context)

@login_required_custom
def edit_home(request, id):
    data = get_object_or_404(tbl_home, id=id)
    if request.method == "POST":
        data.serial = request.POST.get("serial")
        data.heading = request.POST.get("heading")
        data.image_url = request.POST.get("image_url")
        data.description = request.POST.get("description")
        data.image_id = extract_drive_id(data.image_url)

        data.save()
        request.session["update_success"] = True
        return redirect('home_list') 
    context = {
        "data": data,
        "is_edit": True,
    }
    return render(request, "home-form.html", context)
    
@login_required_custom
def delete_home(request, id):
    data = get_object_or_404(tbl_home, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('home_list')  
    
# news

@login_required_custom
def add_news(request):
    if request.method == "POST":
        heading = request.POST.get("heading")
        image_url = request.POST.get("image_url")
        description = request.POST.get("description")
        image_id = extract_drive_id(image_url)
        
        tbl_news.objects.create(
            heading = heading,
            image_url = image_url,
            description = description,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(news_list)
    return render(request, "news-form.html")

@login_required_custom
def news_list(request):
    news_queryset = tbl_news.objects.all().order_by("-id")

    paginator = Paginator(news_queryset, 10)  # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "News",
        "news": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "news-list.html", context)

@login_required_custom
def news_view(request, id):
    data = get_object_or_404(tbl_news, id=id)
    context = {
        "data":data,
    }
    return render(request, "news-view.html", context)

@login_required_custom
def edit_news(request, id):
    news = get_object_or_404(tbl_news, id=id)
    if request.method == "POST":
        news.heading = request.POST.get("heading")
        news.image_url = request.POST.get("image_url")
        news.description = request.POST.get("description")
        news.image_id = extract_drive_id(news.image_url)
        news.save()
        request.session["update_success"] = True
        return redirect('news_list')

    context = {
        "news": news,
        "is_edit": True,
    }
    return render(request, "news-form.html", context)
    
@login_required_custom
def delete_news(request, id):
    news = get_object_or_404(tbl_news, id=id)
    news.delete()
    request.session["delete_success"] = True
    return redirect('news_list')
    
# team

@login_required_custom
def add_team(request):
    if request.method == "POST":
        name = request.POST.get("name")
        tweeter = request.POST.get("tweeter")
        linkedin = request.POST.get("linkedin")
        facebook = request.POST.get("facebook")
        designation = request.POST.get("designation")
        description = request.POST.get("description")
        image_url = request.POST.get("image_url")
        image_id = extract_drive_id(image_url)

        tbl_team.objects.create(
            name = name,
            tweeter = tweeter,
            linkedin = linkedin,
            facebook = facebook,
            designation = designation,
            description = description,
            image_url = image_url,
            image_id = image_id,
            )
        request.session["add_success"] = True
        return redirect(team_list)
    return render(request, "team-form.html")

@login_required_custom
def team_list(request):
    team_queryset = tbl_team.objects.all().order_by("-id")
    
    paginator = Paginator(team_queryset, 10) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Team member",
        "data": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "team-list.html", context)

@login_required_custom
def team_view(request, id):
    data = get_object_or_404(tbl_team, id=id)
    context = {
        "data":data,
    }
    return render(request, "team-view.html", context)

@login_required_custom
def edit_team(request, id):
    data = get_object_or_404(tbl_team, id=id)
    if request.method == "POST":
        data.name = request.POST.get("name")
        data.tweeter = request.POST.get("tweeter")
        data.linkedin = request.POST.get("linkedin")
        data.facebook = request.POST.get("facebook")
        data.designation = request.POST.get("designation")
        data.description = request.POST.get("description")
        data.image_url = request.POST.get("image_url")
        data.image_id = extract_drive_id(data.image_url)

        data.save()
        request.session["update_success"] = True
        return redirect('team_list')  
        
    context = {
        "data": data,
        "is_edit": True,
    }
    return render(request, "team-form.html", context)
    
@login_required_custom
def delete_team(request, id):
    data = get_object_or_404(tbl_team, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('team_list')

# faq

@login_required_custom
def add_faq(request):
    if request.method == "POST":
        question = request.POST.get("question")
        answer = request.POST.get("answer")
        tbl_faq.objects.create(
            question = question,
            answer = answer,
            )
        request.session["add_success"] = True
        return redirect(faq_list)
    return render(request, "faq-form.html")

@login_required_custom
def faq_list(request):
    faq_queryset = tbl_faq.objects.all().order_by("-id")
    
    paginator = Paginator(faq_queryset, 10) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)
    
    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "faq Content",
        "data": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "faq-list.html", context)
    
@login_required_custom
def faq_view(request, id):
    data = get_object_or_404(tbl_faq, id=id)
    context = {
        "data":data,
    }
    return render(request, "faq-view.html", context)

@login_required_custom
def edit_faq(request, id):
    data = get_object_or_404(tbl_faq, id=id)
    if request.method == "POST":
        data.question = request.POST.get("question")
        data.answer = request.POST.get("answer")
        data.save()
        request.session["update_success"] = True
        return redirect('faq_list') 
    context = {
        "data": data,
        "is_edit": True,
    }
    return render(request, "faq-form.html", context)
    
@login_required_custom
def delete_faq(request, id):
    data = get_object_or_404(tbl_faq, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('faq_list')  
    

# ============================================================ Blog ============================================================

# blog

@login_required_custom
def add_blog(request):
    if request.method == "POST":
        heading = request.POST.get("heading")
        title = request.POST.get("title")
        title2 = request.POST.get("title2")
        title3 = request.POST.get("title3")
        image_url = request.POST.get("image_url")
        image_id = extract_drive_id(image_url)
        image_url_2 = request.POST.get("image_url_2")
        image_id_2 =  extract_drive_id(image_url_2)
        image_url_3 = request.POST.get("image_url_3")
        image_id_3 =  extract_drive_id(image_url_3)
        description = request.POST.get("description")
        description2 = request.POST.get("description2")
        description3 = request.POST.get("description3")
        
        tbl_blog.objects.create(
            heading = heading,
            title = title,
            title2 = title2,
            title3 = title3,
            image_url = image_url,
            image_id = image_id,
            image_url_2 = image_url_2,
            image_id_2 = image_id_2,
            image_url_3 = image_url_3,
            image_id_3 = image_id_3,
            description = description,
            description2 = description2,
            description3 = description3,
            )
        request.session["add_success"] = True
        return redirect(blog_list)
    return render(request, "blog-form.html")

@login_required_custom
def blog_list(request):
    blog_queryset = tbl_blog.objects.all().order_by("-id")

    paginator = Paginator(blog_queryset, 10)  
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Blog",
        "data": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "blog-list.html", context)

@login_required_custom
def blog_view(request, id):
    data = get_object_or_404(tbl_blog, id=id)
    context = {
        "data":data,
    }
    return render(request, "blog-view.html", context)

@login_required_custom
def edit_blog(request, id):
    data = get_object_or_404(tbl_blog, id=id)
    if request.method == "POST":
        data.heading = request.POST.get("heading")
        data.title = request.POST.get("title")
        data.title2 = request.POST.get("title2")
        data.title3 = request.POST.get("title3")
        data.image_url = request.POST.get("image_url")
        data.image_id = extract_drive_id(data.image_url)
        data.image_url_2 = request.POST.get("image_url_2")
        data.image_id_2 =  extract_drive_id(data.image_url_2)
        data.image_url_3 = request.POST.get("image_url_3")
        data.image_id_3 =  extract_drive_id(data.image_url_3)
        data.description = request.POST.get("description")
        data.description2 = request.POST.get("description2")
        data.description3 = request.POST.get("description3")

        data.save()
        request.session["update_success"] = True
        return redirect('blog_list')  
        
    context = {
        "data": data,
        "is_edit": True,
    }
    return render(request, "blog-form.html", context)
    
@login_required_custom
def delete_blog(request, id):
    data = get_object_or_404(tbl_blog, id=id)
    data.delete()
    request.session["delete_success"] = True
    return redirect('blog_list')  

# comments

@login_required_custom
def add_comments(request):
    # if request.method == "POST":
        # image = request.POST.get("image")
        # description = request.POST.get("description")
        
        # tbl_gallery.objects.create(
        #     image = image,
        #     description = description,
        #     image = image_name,
        #     )
        # request.session["add_success"] = True
        # return redirect(image_list)
    return render(request, "comment-form.html")

@login_required_custom
def comments_list(request):
    # image = tbl_gallery.objects.all().order_by("image")
    # add_success = request.session.pop("add_success", None)
    # update_success = request.session.pop("update_success", None)
    # delete_success = request.session.pop("delete_success", None)
    
    context = {
        # "add_success": add_success,
        # "update_success": update_success,
        # "delete_success": delete_success,    
        # "record_name": "image",    
        # "image":image,
        "my_range": range(1,11)
    }
    return render(request, "comment-list.html", context)

@login_required_custom
def edit_comments(request, id):
    # image = get_object_or_404(tbl_gallery, id=id)
    
    # if request.method == "POST":
    #     image = request.POST.get("image")
    #     description = request.POST.get("description")
    #     image.image_name = image_name_
    #     image.description = description
    #     image.save()
    #     request.session["update_success"] = True
    #     return redirect('image_list')  # Make sure 'image_list' is a valid URL name

    context = {
    #     "image": image,
        "is_edit": True,
    }
    return render(request, "comment-form.html", context)
    
@login_required_custom
def delete_comments(request, id):
    # image = get_object_or_404(tbl_gallery, id=id)
    # image.delete()
    # request.session["delete_success"] = True
    return redirect('comments_list')  # Again, ensure 'image_list' is the correct URL name

# ============================================================ About Us ============================================================

# about_us

@login_required_custom
def add_about_us(request):
    if request.method == "POST":
        heading = request.POST.get("heading")
        category = request.POST.get("category")
        image_url = request.POST.get("image_url")
        description = request.POST.get("description")
        
        image_id = extract_drive_id(image_url)
        
        tbl_about_us.objects.create(
            heading = heading,
            category = category,
            image_url = image_url,
            image_id = image_id,
            description = description,
            )
        request.session["add_success"] = True
        return redirect(about_us_list)
    return render(request, "about-us-form.html")

@login_required_custom
def about_us_list(request):
    about_queryset = tbl_about_us.objects.all().order_by("-id")

    paginator = Paginator(about_queryset, 10)  # Show 10 items per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    add_success = request.session.pop("add_success", None)
    update_success = request.session.pop("update_success", None)
    delete_success = request.session.pop("delete_success", None)

    context = {
        "add_success": add_success,
        "update_success": update_success,
        "delete_success": delete_success,
        "record_name": "Content",
        "about": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "about-us-list.html", context)

@login_required_custom
def about_us_view(request, id):
    data = get_object_or_404(tbl_about_us, id=id)
    context = {
        "data":data,
    }
    return render(request, "About-us-view.html", context)

@login_required_custom
def edit_about_us(request, id):
    about = get_object_or_404(tbl_about_us, id=id)
    if request.method == "POST":
        about.heading = request.POST.get("heading")
        about.category = request.POST.get("category")
        about.image_url = request.POST.get("image_url")
        about.description = request.POST.get("description") 
        
        about.image_id = extract_drive_id(about.image_url)
            
        about.save()
        request.session["update_success"] = True
        return redirect('about_us_list') 
        
    context = {
        "about": about,
        "is_edit": True,
    }
    return render(request, "about-us-form.html", context)
    
@login_required_custom
def delete_about_us(request, id): 
    about = get_object_or_404(tbl_about_us, id=id)
    about.delete()
    request.session["delete_success"] = True
    return redirect('about_us_list')  
    
# ============================================================ Contact Us ============================================================

# --- Visa Inquiry POST --- (contact, visitor visa, investor Visa, WP visa)

@api_view(['POST'])
def submit_visa_inquiry(request):
    """Handle visa inquiry submissions via POST."""
    try:
        if request.method == 'POST': 
            name = request.data.get("name")
            email = request.data.get("email")
            number = request.data.get("number")
            desired_country = request.data.get("desired_country")
            desired_visa_service = request.data.get("desired_visa_service")
            resume = request.data.get("resume")
            course = request.data.get("course")
            message = request.data.get("message")
            captcha_entered = request.data.get("captcha_entered")
            
            interested_in_coaching = request.data.get("interested_in_coaching", False)
            
            if str(interested_in_coaching).lower() in ["true", "1", "on", "yes"]:
                interested_in_coaching = True
            else:
                interested_in_coaching = False
            
            new = visa_inquiry.objects.create(
                name = name,
                email = email,
                number = number,
                desired_country = desired_country,
                desired_visa_service = desired_visa_service,
                resume = resume,
                interested_in_coaching = interested_in_coaching,
                course = course,
                message = message,
                captcha_entered = captcha_entered,
            )
            new.save()
            return Response({"success": f"Data '{name}' added successfully!"}, status=status.HTTP_201_CREATED)
    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

# --- Visa Inquiry View --- (contact, visitor visa, investor Visa, WP visa)

@login_required_custom
def inquiry_view(request):
    all_inq_queryset = visa_inquiry.objects.all().order_by("-id")
    
    paginator = Paginator(all_inq_queryset, 10)  # Show 10 inquiries per page
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    context = {
        "all_inq": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "inquiry-list.html", context)

@login_required_custom
def inq_detail(request, id):
    inq = get_object_or_404(visa_inquiry, id=id)
    context = {
        "inq":inq,
    }
    return render(request, "inquiry-detail.html", context)

@login_required_custom
def delete_inquiry(request, id):
    inq = get_object_or_404(visa_inquiry, id=id)
    inq.delete()
    return redirect('inquiry_view')


# --- PR Visa Inquiry POST --- 

@api_view(['POST'])
def submit_pr_visa_inquiry(request):
    try:
        if request.method == 'POST':
            # Generate a unique inquiry ID
            inquiry_id = str(uuid.uuid4())

            # Save the main PR visa inquiry
            pr_visa = tbl_pr_visa_inquiry.objects.create(
                desired_country=request.data.get("desired_country"),
                desired_visa_route=request.data.get("desired_visa_route"),
                relation=request.data.get("relation"),
                name=request.data.get("name"),
                number=request.data.get("number"),
                landline=request.data.get("landline", ""),
                alt_number=request.data.get("alt_number", ""),
                email=request.data.get("email"),
                dob=request.data.get("dob"),
                marital_status=request.data.get("marital_status"),
                no_of_child=request.data.get("no_of_child"),
                flat_no=request.data.get("flat_no"),
                building_name=request.data.get("building_name"),
                road_street=request.data.get("road_street"),
                pincode=request.data.get("pincode"),
                area=request.data.get("area"),
                city=request.data.get("city"),
                inquiry_id=inquiry_id,
                resume=request.FILES.get("resume")
            )

            # Parse and save education details
            education_data = json.loads(request.data.get("education_qualifications", "[]"))
            for edu in education_data:
                tbl_education_qualification.objects.create(
                    inquiry_id=inquiry_id,
                    qualification=edu.get("qualification"),
                    stream_of_degree=edu.get("stream_of_degree"),
                    major_degree=edu.get("major_degree"),
                    year_of_completion=edu.get("year_of_completion"),
                    percentage=edu.get("percentage"),
                    total_backlog=edu.get("total_backlog"),
                )

            # Parse and save employment details
            employment_data = json.loads(request.data.get("employeement_details", "[]"))
            for emp in employment_data:
                tbl_employeement_detail.objects.create(
                    inquiry_id=inquiry_id,
                    company=emp.get("company"),
                    designation=emp.get("designation"),
                    from_date=emp.get("from_date"),
                    to_date=emp.get("to_date"),
                    no_of_years=emp.get("no_of_years"),
                )

            # Parse and save exam details
            exam_data = json.loads(request.data.get("exam_details", "[]"))
            for ex in exam_data:
                tbl_exam_detail.objects.create(
                    inquiry_id=inquiry_id,
                    exam=ex.get("exam"),
                    listening=ex.get("listening"),
                    reading=ex.get("reading"),
                    writing=ex.get("writing"),
                    speaking=ex.get("speaking"),
                    final_score=ex.get("final_score"),
                )

            # Parse and save test details
            test_data = json.loads(request.data.get("test_details", "[]"))
            for test in test_data:
                tbl_test_detail.objects.create(
                    inquiry_id=inquiry_id,
                    exam=test.get("exam"),
                    verbal_reasoning=test.get("verbal_reasoning"),
                    quantitative_reasoning=test.get("quantitative_reasoning"),
                    analytical_writing=test.get("analytical_writing"),
                    final_score=test.get("final_score"),
                )

            return Response({
                "success": f"Inquiry for '{pr_visa.name}' submitted successfully!",
                "inquiry_id": inquiry_id
            }, status=status.HTTP_201_CREATED)

    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@login_required_custom
def pr_visa_inquiry_view(request):
    all_inq_queryset = tbl_pr_visa_inquiry.objects.all().order_by("-id")
    
    paginator = Paginator(all_inq_queryset, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    context = {
        "all_inq": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "pr-visa-inquiry-list.html", context)


@login_required_custom
def pr_visa_inquiry_detail(request, id):
    inq = get_object_or_404(tbl_pr_visa_inquiry, id=id)
    context = {
        "inq": inq,
    }
    return render(request, "pr-visa-inquiry-detail.html", context)


@login_required_custom
def delete_pr_visa_inquiry(request, id):
    inq = get_object_or_404(tbl_pr_visa_inquiry, id=id)
    inq.delete()
    return redirect('pr_visa_inquiry_view')

# --- PR Visa Inquiry POST --- 

@api_view(['POST'])
def submit_student_visa_inquiry(request):
    try:
        if request.method == 'POST':
            inquiry_id = str(uuid.uuid4())

            # Save the main student visa inquiry
            student_inquiry = tbl_student_visa_inquiry.objects.create(
                relation=request.data.get("relation"),
                name=request.data.get("name"),
                father_name=request.data.get("father_name"),
                contact_number=request.data.get("contact_number"),
                landline_number=request.data.get("landline_number", ""),
                alternate_number=request.data.get("alternate_number", ""),
                email=request.data.get("email"),
                date_of_birth=request.data.get("date_of_birth"),
                desired_country=request.data.get("desired_country"),
                spouse_dependent_visa=request.data.get("spouse_dependent_visa", ""),
                flat_no=request.data.get("flat_no", ""),
                building_name=request.data.get("building_name", ""),
                road_street=request.data.get("road_street", ""),
                pincode=request.data.get("pincode", ""),
                area=request.data.get("area", ""),
                city=request.data.get("city", ""),
                field_of_study=request.data.get("field_of_study", ""),
                level_of_study=request.data.get("level_of_study", ""),
                inquiry_id=inquiry_id,
                resume=request.FILES.get("resume"),
                is_valid_passport=request.data.get("is_valid_passport", ""),
                citizenship=request.data.get("citizenship", ""),
                passport_no=request.data.get("passport_no", ""),
                father_occupation=request.data.get("father_occupation", ""),
                family_income=request.data.get("family_income", ""),
                blood_relative_foreign=request.data.get("blood_relative_foreign", ""),
                countries_names=request.data.get("countries_names", ""),
                how_about_us=request.data.get("how_about_us", ""),
                additional_query=request.data.get("additional_query", "")
            )

            # Save education details
            education_data = json.loads(request.data.get("education_qualifications", "[]"))
            for edu in education_data:
                tbl_education_qualification.objects.create(
                    inquiry_id=inquiry_id,
                    qualification=edu.get("qualification"),
                    stream_of_degree=edu.get("stream_of_degree"),
                    major_degree=edu.get("major_degree"),
                    year_of_completion=edu.get("year_of_completion"),
                    percentage=edu.get("percentage"),
                    total_backlog=edu.get("total_backlog")
                )

            # Save employment details
            employment_data = json.loads(request.data.get("employeement_details", "[]"))
            for emp in employment_data:
                tbl_employeement_detail.objects.create(
                    inquiry_id=inquiry_id,
                    company=emp.get("company"),
                    designation=emp.get("designation"),
                    from_date=emp.get("from_date"),
                    to_date=emp.get("to_date"),
                    no_of_years=emp.get("no_of_years")
                )

            # Save exam details
            exam_data = json.loads(request.data.get("exam_details", "[]"))
            for ex in exam_data:
                tbl_exam_detail.objects.create(
                    inquiry_id=inquiry_id,
                    exam=ex.get("exam"),
                    listening=ex.get("listening"),
                    reading=ex.get("reading"),
                    writing=ex.get("writing"),
                    speaking=ex.get("speaking"),
                    final_score=ex.get("final_score")
                )

            # Save test details
            test_data = json.loads(request.data.get("test_details", "[]"))
            for test in test_data:
                tbl_test_detail.objects.create(
                    inquiry_id=inquiry_id,
                    exam=test.get("exam"),
                    verbal_reasoning=test.get("verbal_reasoning"),
                    quantitative_reasoning=test.get("quantitative_reasoning"),
                    analytical_writing=test.get("analytical_writing"),
                    final_score=test.get("final_score")
                )

            # Save intended study details
            intended_study_data = json.loads(request.data.get("intended_study", "[]"))
            for study in intended_study_data:
                tbl_intended_study.objects.create(
                    inquiry_id=inquiry_id,
                    month=study.get("month"),
                    year=study.get("year")
                )

            return Response({
                "success": f"Inquiry for '{student_inquiry.name}' submitted successfully!",
                "inquiry_id": inquiry_id
            }, status=status.HTTP_201_CREATED)

    except Exception as e:
        return Response({"error": str(e)}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

@login_required_custom
def student_visa_inquiry_view(request):
    all_inq_queryset = tbl_student_visa_inquiry.objects.all().order_by("-id")
    
    paginator = Paginator(all_inq_queryset, 10)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    
    context = {
        "all_inq": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "student-visa-inquiry-list.html", context)


@login_required_custom
def student_visa_inquiry_detail(request, id):
    inq = get_object_or_404(tbl_student_visa_inquiry, id=id)
    context = {
        "inq": inq,
    }
    return render(request, "student-visa-inquiry-detail.html", context)


@login_required_custom
def delete_student_visa_inquiry(request, id):
    inq = get_object_or_404(tbl_student_visa_inquiry, id=id)
    inq.delete()
    return redirect('student_visa_inquiry_view')

# ============================================= [GET type API] =============================================

@api_view(['GET'])
def get_home_data(request):
    home_items = tbl_home.objects.all().order_by('serial') 
    serializer = HomeSerializer(home_items, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_course_data(request):
    courses = tbl_courses.objects.all().order_by('course_name')  # Optional ordering
    serializer = CourseSerializer(courses, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_gallery_data(request):
    gallery_items = tbl_gallery.objects.all().order_by('-created_at')  # Latest first
    serializer = GallerySerializer(gallery_items, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_video_data(request):
    videos = tbl_video.objects.all().order_by('-created_at')  # Latest videos first
    serializer = VideoSerializer(videos, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_success_stories(request):
    stories = tbl_success_stories.objects.all().order_by('-created_at')  # Latest first
    serializer = SuccessStorySerializer(stories, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_blog_data(request):
    blogs = tbl_blog.objects.all().order_by('-created_at')
    serializer = BlogSerializer(blogs, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_visa_services(request):
    visas = tbl_visa_service.objects.all().order_by('-created_at')
    serializer = VisaServiceSerializer(visas, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_about_us_data(request):
    about_data = tbl_about_us.objects.all().order_by('serial')
    serializer = AboutUsSerializer(about_data, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_team_data(request):
    team = tbl_team.objects.all().order_by('name')
    serializer = TeamSerializer(team, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_news_data(request):
    news = tbl_news.objects.all().order_by('-created_at')
    serializer = NewsSerializer(news, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_country_data(request):
    countries = tbl_country.objects.all().order_by('country')
    serializer = CountrySerializer(countries, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_occupation_data(request):
    occupations = tbl_occupation.objects.all().order_by('occupation')
    serializer = OccupationSerializer(occupations, many=True)
    return Response(serializer.data)

@api_view(['GET'])
def get_faq_data(request):
    faq_items = tbl_faq.objects.all().order_by('-id') 
    serializer = FaqSerializer(faq_items, many=True)
    return Response(serializer.data)

# ============================================= [GET type (Detail) API] =============================================

@api_view(['GET'])
def get_success_story_detail(request, id):
    try:
        story = tbl_success_stories.objects.get(id=id)
    except tbl_success_stories.DoesNotExist:
        return Response({"error": "Success story not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = SuccessStorySerializer(story)
    return Response(serializer.data)

@api_view(['GET'])
def get_course_detail(request, id):
    try:
        course = tbl_courses.objects.get(id=id)
    except tbl_courses.DoesNotExist:
        return Response({"error": "Course not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = CourseSerializer(course)
    return Response(serializer.data)

@api_view(['GET'])
def get_gallery_image_detail(request, id):
    try:
        image = tbl_gallery.objects.get(id=id)
    except tbl_gallery.DoesNotExist:
        return Response({"error": "Image not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = GallerySerializer(image)
    return Response(serializer.data)

@api_view(['GET'])
def get_video_detail(request, id):
    try:
        video = tbl_video.objects.get(id=id)
    except tbl_video.DoesNotExist:
        return Response({"error": "Video not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = VideoSerializer(video)
    return Response(serializer.data)

@api_view(['GET'])
def get_success_story_detail(request, id):
    try:
        story = tbl_success_stories.objects.get(id=id)
    except tbl_success_stories.DoesNotExist:
        return Response({"error": "Success story not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = SuccessStorySerializer(story)
    return Response(serializer.data)

@api_view(['GET'])
def get_blog_detail(request, id):
    try:
        blog = tbl_blog.objects.get(id=id)
    except tbl_blog.DoesNotExist:
        return Response({"error": "Blog not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = BlogSerializer(blog)
    return Response(serializer.data)

@api_view(['GET'])
def get_news_detail(request, id):
    try:
        news = tbl_news.objects.get(id=id)
    except tbl_news.DoesNotExist:
        return Response({"error": "News not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = NewsSerializer(news)
    return Response(serializer.data)

@api_view(['GET'])
def get_team_detail(request, id):
    try:
        member = tbl_team.objects.get(id=id)
    except tbl_team.DoesNotExist:
        return Response({"error": "Team member not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = TeamSerializer(member)
    return Response(serializer.data)


@api_view(['GET'])
def get_visa_service_detail(request, id):
    try:
        visa = tbl_visa_service.objects.get(id=id)
    except tbl_visa_service.DoesNotExist:
        return Response({"error": "Visa service not found."}, status=status.HTTP_404_NOT_FOUND)

    serializer = VisaServiceSerializer(visa)
    return Response(serializer.data)

