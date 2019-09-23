from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Swiper


class SwiperSerializer(serializers.ModelSerializer):
    created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    status = serializers.SerializerMethodField('get_status')
    class Meta:
        model = Swiper
        fields = ('id', 'name', 'admins', 'img', 'created_time', 'status')

    def get_status(self, obj):
        return '0'













