from django.db import models

import uuid
import datetime


def custom_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid.uuid4(), ext)
    return filename


class OtherInfo(models.Model):
    """
    其他用户信息
    """
    SEX_TYPE = (
        (1, "男"),
        (2, "女"),
        (3, "未知"),
    )
    sex = models.IntegerField(default=3, choices=SEX_TYPE, verbose_name="性别")
    birthday = models.DateTimeField(default=datetime.datetime.now, verbose_name="出生日期")
    say_sth = models.CharField(default="这个人懒死了，什么都没有写╮(╯▽╰)╭", max_length=25, verbose_name="签名")

    class Meta:
        verbose_name = "其他用户信息"
        verbose_name_plural = verbose_name


class User(models.Model):
    """
    基本用户信息
    """
    username = models.CharField(max_length=30, verbose_name="用户名")
    password = models.CharField(max_length=20, verbose_name="密码")
    jwt = models.CharField(max_length=300, null=True, blank=True, verbose_name="JWT")
    nickname = models.CharField(max_length=10, default="无名", verbose_name="昵称")
    face = models.ImageField(upload_to=custom_path, default="default_face.jpg", verbose_name="封面")
    random = models.UUIDField(default=uuid.uuid4, null=False, verbose_name="随机码")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="注册时间")
    other_info = models.OneToOneField(OtherInfo, null=True, blank=True, on_delete=models.CASCADE, verbose_name="其他用户信息")

    class Meta:
        verbose_name = "基本用户信息"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.username


