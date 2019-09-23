from django.shortcuts import render
from django.http import JsonResponse

from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from .models import Swiper
from .serializer import SwiperSerializer


# Create your views here.
class GetSwiperView(APIView):
    """
    获取当前用户的某篇文章
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        swiper_list = Swiper.objects.all().order_by('-created_time')
        if swiper_list:
            swiper_list = SwiperSerializer(swiper_list, many=True)
            return Response(swiper_list.data)
        context = {'status': '1', 'msg': 'FAIL'}
        return JsonResponse(context)