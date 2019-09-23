from django.shortcuts import render
from django.http import JsonResponse
from django.db.models import Q

from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from .models import Film
from .serializer import FilmSerializer


# Create your views here.
class GetFilmView(APIView):
    """
    获取所有电影
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        film_list = Film.objects.all()
        if film_list:
            film_list = FilmSerializer(film_list, many=True)
            return Response(film_list.data)
        context = {'status': '1', 'msg': 'FAIL'}
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
        context = {'status': '1', 'msg': 'FAIL'}
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
        context = {'status': '1', 'msg': 'FAIL'}
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
            film = FilmSerializer(film)
            return Response(film.data)
        context = {'status': '1', 'msg': 'FAIL'}
        return JsonResponse(context)