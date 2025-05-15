
@login_required_custom
def video_view(request, id):
    data = get_object_or_404(tbl_video, id=id)
    context = {
        "data":data,
    }
    return render(request, "success-story-view.html", context)
    path('video_view/<int:id>', views.video_view, name='video_view'),
