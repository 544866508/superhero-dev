# coding=utf-8
import jwt
from django.shortcuts import render
from django.http import JsonResponse

from dateutil.parser import parse
from jsonpickle import json
from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response
from django.db.models import Q, F

from .models import User, OtherInfo, UserFilm
from .serializer import UserSerializer, LoginSerializer
from apps.film.models import Film
from apps.film.serializer import FilmSerializer
from utils.JWTutils import checkOnlyUser, checkJWT, deleteJWT, checkUserJWT


class RegisterView(APIView):
    """
    用户注册
    """
    renderer_classes = [JSONRenderer]

    def post(self, request):
        username = request.POST.get('username', None)
        if username:
            if User.objects.filter(username=username):
                context = {'status': '403', 'msg': '用户已存在'}
                return JsonResponse(context)
            else:
                password = request.POST.get('password', None)
                user = User()
                user.username = username
                user.password = password
                other_info = OtherInfo()
                other_info.save()
                user.other_info = other_info
                user.save()
                serializer = UserSerializer(user)
                return Response(serializer.data)
        context = {'status': '404', 'msg': '页面不存在'}
        return JsonResponse(context)


class LoginView(APIView):
    """
    用户登录
    安全措施：
        验证重复登录(checkOnlyUser)
        生成JWT(序列化时生成)
    """
    renderer_classes = [JSONRenderer]

    def post(self, request):
        username = request.POST.get('username', None)
        if username:
            user = User.objects.filter(username=username)
            user = user[0]
            if not user:
                context = {'status': '400', 'msg': '用户名不存在'}
                return JsonResponse(context)
            else:
                password = request.POST.get('password', None)
                if password == user.password:
                    # 用户名密码均正确，判断是否重复登录
                    if checkOnlyUser(user):
                        # 无重复登录，返回用户信息
                        serializer = LoginSerializer(user)
                        return Response(serializer.data)
                    else:
                        context = {'status': '400', 'msg': '该用户已登录,请勿重复登录'}
                        return JsonResponse(context)
                else:
                    context = {'status': '403', 'msg': '密码错误'}
                    return JsonResponse(context)
        context = {'status': '404', 'msg': '页面不存在'}
        return JsonResponse(context)


class LoginOutView(APIView):
    """
    用户退出登录
    安全措施：
        验证JWT（@checkUserJWT）
        删除JWT（deleteJWT）
    """
    @checkUserJWT
    def delete(self, request):
        user_id = request.data.get('user_id', 0)
        user = User.objects.filter(id=user_id).first()
        if user:
            # 删除JWT
            deleteJWT(user)
            context = {'status': '200'}
            return JsonResponse(context)


class GetUserInfoView(APIView):
    """
    获取用户信息
    安全措施：
        验证JWT（@checkUserJWT）
    """
    renderer_classes = [JSONRenderer]

    @checkUserJWT
    def get(self, request):
        # 获取用户信息
        user_id = request.GET.get('user_id')
        user = User.objects.filter(id=user_id).first()
        if user:
            serializer = UserSerializer(user)
            return Response(serializer.data)


class UserInfoView(APIView):
    """
    获取用户信息
    安全措施：
        验证JWT（@checkUserJWT）
    """
    renderer_classes = [JSONRenderer]

    @checkUserJWT
    def put(self, request):
        user_id = request.data.get('user_id', 0)
        print(user_id)
        user = User.objects.filter(id=user_id).first()
        if user:

            # 获取sex信息,如果存在就修改
            sex = request.data.get('sex')
            if sex:
                user.other_info.sex = sex
                user.other_info.save()
                context = {'status': '200'}
                return JsonResponse(context)

            # 获取nickname信息,如果存在就修改
            nickname = request.data.get('nickname')
            if nickname:
                user.nickname = nickname
                user.save()
                context = {'status': '200'}
                return JsonResponse(context)

            # 获取saysth信息,如果存在就修改
            saysth = request.data.get('saysth')
            if saysth:
                print(saysth)
                user.other_info.say_sth = saysth
                user.other_info.save()
                context = {'status': '200'}
                return JsonResponse(context)

            # 获取birthday信息,如果存在就修改
            birthday = request.data.get('birthday')
            if birthday:
                print(birthday)
                user.other_info.birthday = parse(birthday)
                user.other_info.save()
                context = {'status': '200'}
                return JsonResponse(context)

    @checkUserJWT
    def post(self, request):
        user_id = request.data.get('user_id', 0)
        print(user_id)
        user = User.objects.filter(id=user_id).first()
        if user:
            # 获取face信息,如果存在就修改
            face = request.FILES.get('file', None)
            if face:
                user.face = face
                user.save()
                face = '/media/' + str(user.face)
                context = {
                    'status': '200',
                    'face': face
                }
                return JsonResponse(context)


class CheckJWTView(APIView):
    """
    仅验证JWT
    安全措施：
        验证JWT（@checkUserJWT）
    """
    renderer_classes = [JSONRenderer]

    @checkUserJWT
    def post(self, request):
        context = {'status': '200'}
        return JsonResponse(context)


class InterestMovie(APIView):
    """
    用户收藏电影,取消收藏电影
    安全措施：
        验证JWT（@checkUserJWT）
    """
    renderer_classes = [JSONRenderer]

    # 收藏
    @checkUserJWT
    def post(self, request):
        user_id = request.data.get('user_id', 0)
        movie_id = request.data.get('movie_id', 0)
        if user_id and movie_id:
            user = User.objects.filter(id=user_id).first()
            film = Film.objects.filter(id=movie_id).first()
            if user and film:

                # 对film的收藏数+1
                film.prised_count = F('prised_count') + 1   # F函数避免多线程竞争
                film.save()

                # 添加收藏
                user_film = UserFilm()
                user_film.user = user
                user_film.film = film
                user_film.save()

                context = {'status': '200'}
                return JsonResponse(context)

    # 取消收藏
    @checkUserJWT
    def delete(self, request):
        user_id = request.data.get('user_id', 0)
        movie_id = request.data.get('movie_id', 0)
        if user_id and movie_id:
            # 查询当前用户准备取消收藏的影片
            user_film = UserFilm.objects.filter(Q(user_id=user_id) & Q(film_id=movie_id))
            film = user_film[0].film

            # 对film的收藏数-1
            film.prised_count = F('prised_count') - 1  # F函数避免多线程竞争
            film.save()

            # 取消收藏
            user_film.delete()

            context = {'status': '200'}
            return JsonResponse(context)


class GetMyInterestFilmView(APIView):
    """
    获取当前用户收藏的电影
    """
    renderer_classes = [JSONRenderer]

    @checkUserJWT
    def get(self, request):
        user_id = request.GET.get('user_id', 0)
        user = User.objects.filter(id=user_id).first()
        films = user.interest_film

        serializer = FilmSerializer(films, many=True)
        return Response(serializer.data)


class GetHIstoryFilmView(APIView):
    """
    获取浏览记录的电影
    """
    renderer_classes = [JSONRenderer]

    @checkUserJWT
    def get(self, request):

        # history_films = Film.objects.filter(id = )
        # if swiper_films:
        #     print(swiper_films)
        #     serializer = SwiperSerializer(swiper_films, many=True)
        #     print(serializer.data)
        #     return Response(serializer.data)

        history_id = request.GET.get('history', 0)
        history_id = history_id.split(",")
        history_films = Film.objects.filter(id__in=history_id)
        serializer = FilmSerializer(history_films, many=True)
        return Response(serializer.data)