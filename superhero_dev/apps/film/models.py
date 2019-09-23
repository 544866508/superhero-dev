from django.db import models
import django.utils.timezone as timezone

import uuid


def custom_path(instance, filename):
    ext = filename.split('.')[-1]
    filename = '{}.{}'.format(uuid.uuid4(), ext)
    return filename


class Actor(models.Model):
    """
    演员
    """
    name = models.CharField(max_length=30, verbose_name="演员")
    desc = models.TextField(verbose_name="演员生涯")
    photo = models.ImageField(upload_to=custom_path, null=True, blank=True, verbose_name="演员照片")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "演员"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class Film(models.Model):
    """
    影片
    """
    name = models.CharField(max_length=30, verbose_name="电影名称")
    cover = models.ImageField(upload_to=custom_path, verbose_name="封面")
    trailer = models.FileField(upload_to=custom_path, null=True, blank=True, verbose_name="视频内容")
    score = models.DecimalField(max_digits=3, decimal_places=1, verbose_name="分数")
    prised_count = models.IntegerField(verbose_name="点赞数")
    basic_info = models.CharField(max_length=100, verbose_name="基本信息")
    original_name = models.CharField(max_length=30, verbose_name="原名")
    release_date = models.DateTimeField(default=timezone.now, verbose_name="上映时间")
    release_place = models.CharField(max_length=10, verbose_name="上映地点")
    total_time = models.IntegerField(verbose_name="影片时长")
    plot_desc = models.TextField(verbose_name="剧情描述")
    directors = models.CharField(max_length=30, verbose_name="导演")
    actor = models.ManyToManyField(Actor, through='FilmActor', verbose_name="演员")
    is_hot = models.BooleanField(default=False, verbose_name="是否热门")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "影片"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name


class FilmActor(models.Model):
    """
    演员和电影的索引表
    """
    film = models.ForeignKey(Film, on_delete=models.CASCADE)
    actor = models.ForeignKey(Actor, on_delete=models.CASCADE)
    role = models.CharField(max_length=20, null=True, blank=True, verbose_name="出演角色")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "演员和电影的索引表"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.film.name


class Poster(models.Model):
    """
    海报
    """
    film = models.ForeignKey(Film, on_delete=models.CASCADE, related_name='poster', verbose_name="电影")
    poster = models.ImageField(upload_to=custom_path, verbose_name="海报")
    created_time = models.DateTimeField(auto_now_add=True, verbose_name="创建时间")

    class Meta:
        verbose_name = "海报"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.film.name
