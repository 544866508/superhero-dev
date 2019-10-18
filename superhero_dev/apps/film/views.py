import random

from django.forms import model_to_dict
from django.shortcuts import render
from django.http import JsonResponse
from django.db.models import Q

from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from .models import Film
from .serializer import FilmSerializer, SwiperSerializer, FilmDetailSerializer


# Create your views here.
class GetAllFilmView(APIView):
    """
    获取热门电影
    查询方式：随机排序
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        film_list = Film.objects.all().order_by('?')
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '400', 'msg': '页面加载失败'}
        return JsonResponse(context)


class GetHotFilmView(APIView):
    """
    获取热门电影
    查询方式：获取收藏数最多的前10部电影，然后随机排序(todo)
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        film_list = Film.objects.all().order_by('-prised_count')
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '400', 'msg': '页面加载失败'}
        return JsonResponse(context)


class GetNewFilmView(APIView):
    """
    获取最新电影
    查询方式：获取上映时间最近的前10部电影，然后随机排序(todo)
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        film_list = Film.objects.all().order_by('-release_date')
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '400', 'msg': '页面加载失败'}
        return JsonResponse(context)


class GetGuessFilmView(APIView):
    """
    猜你喜欢的电影
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        film_list = Film.objects.all().order_by('?')[:2]
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '400', 'msg': '电影获取失败'}
        return JsonResponse(context)


class GetSearchFilmView(APIView):
    """
    关键字模糊查询的电影，匹配name和basic_info
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        keyword = request.GET.get('keyword', None)
        if not keyword:
            film_list = Film.objects.all()
        else:
            film_list = Film.objects.filter(Q(name__icontains=keyword) | Q(basic_info__icontains=keyword))
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '400', 'msg': '查询失败'}
        return JsonResponse(context)


class GetFilmDetailView(APIView):
    """
    获取某个id的电影详情
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        movie_id = request.GET.get('movie_id', None)
        if movie_id:
            film = Film.objects.filter(id=movie_id)
            film = film[0]
            film = FilmDetailSerializer(film)
            return Response(film.data)
        context = {'status': '400', 'msg': '电影获取失败'}
        return JsonResponse(context)


class GetSwiperFilmView(APIView):
    """
    获取轮播的电影
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        swiper_films = Film.objects.filter(is_swiper=True).order_by('-created_time')
        if swiper_films:
            print(swiper_films)
            serializer = SwiperSerializer(swiper_films, many=True)
            print(serializer.data)
            return Response(serializer.data)
        context = {'status': '400', 'msg': '无轮播图'}
        return JsonResponse(context)


