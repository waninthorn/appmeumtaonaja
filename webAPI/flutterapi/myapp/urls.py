from django.urls import path
from .views import *
urlpatterns = [
    # อยากให้ HomePage แสดงอะไร
    # ใช้วิธีการ JsonResponse
#    path('',Home),
   path('api/all-todolist/',all_todolist),
   path('api/post-todolist',post_todolist),
   path('api/update-todolist/<int:TID>',update_todolist),
   path('api/delete-todolist/<int:TID>',delete_todolist),

    path('api/all-expend/',all_expend),
    path('api/post-expend',post_expend),
    path('api/delete-expend/<int:TID>',delete_expend),
    path('api/update-expend/<int:TID>',update_expend),

    # path('api/by-user/',by_user),
    # path('api/all-user/',all_user),
    # path('api/post-user',post_user),
    # path('api/delete-user/<int:TID>',delete_user),
    # path('api/update-user/<int:TID>',update_user),
]