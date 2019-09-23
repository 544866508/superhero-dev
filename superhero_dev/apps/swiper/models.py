from django.db import models
from django.contrib.auth.models import User

import uuid



def custom_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid.uuid4(), ext)
    return filename


class Swiper(models.Model):
    """
    轮播图
    """
    name = models.CharField(max_length=20, verbose_name="电影名称")
    admins = models.ForeignKey(User, on_delete=models.CASCADE, verbose_name="管理者")
    img = models.ImageField(upload_to=custom_path, verbose_name="图片")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "轮播图"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name