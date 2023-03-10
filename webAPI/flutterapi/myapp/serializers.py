from rest_framework import serializers
from .models import Todolist
from .models import Expend
class TodolistSerializer(serializers.ModelSerializer):
    class Meta:
        model = Todolist
        fields = ('id','title','detail')

class ExpendSerializer(serializers.ModelSerializer):
    class Meta:
        model = Expend
        fields = ('id','dateInput','id_project','name_project','detail','total')

# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ('id','id_user','first_name','last_name','faction','department','email','password')