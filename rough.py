
@login_required_custom
def personalized_guidance_view(request):
    personalized_guidance_qs = PersonalizedGuidance.objects.all().order_by('-id')

    paginator = Paginator(personalized_guidance_qs, 10)
    page_number = request.GET.get("page")
    page_obj = paginator.get_page(page_number)

    context = {
        "all_personalized_guidances": page_obj.object_list,
        "page_obj": page_obj,
    }
    return render(request, "personalized_guidance-list.html", context)

@login_required_custom
def personalized_guidance_detail(request, id):
    record = get_object_or_404(PersonalizedGuidance, id=id)
    context = {
        "record": record,
    }
    return render(request, "personalized_guidance-detail.html", context)

@login_required_custom
def delete_personalized_guidance(request, id):
    record = get_object_or_404(PersonalizedGuidance, id=id)
    record.delete()
    return redirect('personalized_guidance_view')
