import jwt
from django.shortcuts import render
from django.http import JsonResponse

from dateutil.parser import parse
from jsonpickle import json
from rest_framework.views import APIView
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from .models import User, OtherInfo
from .serializer import UserSerializer, LoginSerializer
from utils.JWTutils import checkOnlyUser, checkJWT, deleteJWT


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
                    context = {'status': '400', 'msg': '密码错误'}
                    return JsonResponse(context)
        context = {'status': '404', 'msg': '页面不存在'}
        return JsonResponse(context)


class LoginOutView(APIView):
    """
    用户退出登录
    安全措施：
        验证JWT（checkJWT）
        删除JWT（deleteJWT）
    """
    def delete(self, request):
        # 验证JWT
        if checkJWT(request):
            user_id = request.data.get('user_id', 0)
            user = User.objects.filter(id=user_id).first()
            if user:
                # 删除JWT
                deleteJWT(user)
                context = {'status': '200'}
                return JsonResponse(context)
        context = {'status': '403', 'msg': '登录过期或非法请求'}
        return JsonResponse(context)


class GetUserInfoView(APIView):
    """
    获取用户信息
    安全措施：
        验证JWT（checkJWT）
    """
    renderer_classes = [JSONRenderer]

    def get(self, request):
        # 验证JWT
        if checkJWT(request):
            # 获取用户信息
            user_id = request.GET.get('user_id')
            user = User.objects.filter(id=user_id).first()
            if user:
                serializer = UserSerializer(user)
                return Response(serializer.data)
        context = {'status': '403', 'msg': '登录过期或非法请求'}
        return JsonResponse(context)


class UserInfoView(APIView):
    """
    获取用户信息
    安全措施：
        验证JWT（checkJWT）
    """
    renderer_classes = [JSONRenderer]

    def put(self, request):
        # 验证JWT
        if checkJWT(request):
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
        context = {'status': '403', 'msg': '登录过期或非法请求'}
        return JsonResponse(context)

    def post(self, request):
        # 验证JWT
        if checkJWT(request):
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
        context = {'status': '403', 'msg': '登录过期或非法请求'}
        return JsonResponse(context)