from django.contrib import admin
from .models import Swiper


@admin.register(Swiper)
class SwiperAdmin(admin.ModelAdmin):
    list_display = ('name', 'admins', 'img')


