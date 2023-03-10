from django.db import models

class Todolist(models.Model):
        title = models.CharField(max_length=100)
        detail = models.TextField(null=True, blank=True)
        
        # เพิ่มฟังก์ชัน หากมีการเรียกใช้ ให้แสดง title
        def __str__(self):
                return self.title
                
class Expend(models.Model):
        dateInput = models.DateField(null=False, blank=False)
        id_project = models.TextField(null=False, blank=False)
        name_project = models.TextField(null=False, blank=False)
        detail = models.TextField(null=False, blank=False)
        total = models.TextField(null=False, blank=False)
        def __str__(self):
                return self.id_project

# Create your models here.
# class User(models.Model):
#         id_user = models.TextField(max_length=32)
#         first_name = models.CharField(max_length=32)
#         last_name= models.CharField(max_length=32)
#         faction = models.TextField(max_length=100)
#         department = models.TextField(max_length=100)
#         email = models.CharField(max_length=32)
#         password = models.CharField(max_length=32)
#         # เพิ่มฟังก์ชัน หากมีการเรียกใช้ ให้แสดง title
#         def __str__(self):
#                 return self.id_user