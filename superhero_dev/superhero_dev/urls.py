# coding=utf-8
"""superhero_dev URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include, re_path
from django.views.static import serve

from rest_framework.documentation import include_docs_urls
import jwt

from apps.film.views import GetAllFilmView, GetNewFilmView, GetHotFilmView, GetGuessFilmView, GetSearchFilmView, GetFilmDetailView, GetSwiperFilmView
from apps.user.views import RegisterView, LoginView, LoginOutView, GetUserInfoView, UserInfoView, CheckJWTView, InterestMovie, GetMyInterestFilmView, GetHIstoryFilmView
from superhero_dev.settings import MEDIA_ROOT

urlpatterns = [
    path('admin/', admin.site.urls),
    # coreapi接口文档说明
    path(r'docs/', include_docs_urls(title="超英预告")),
    # meidia的相关配置(此路径用于访问服务器的图片)
    re_path(r'media/(?P<path>.*)$', serve, {'document_root': MEDIA_ROOT}),

    # 获取轮播图
    path('api/v1/get/swiper/', GetSwiperFilmView.as_view()),

    # 获取所有影片（分页）
    path('api/v1/get/all_film/', GetAllFilmView.as_view()),

    # 获取最新影片（分页）
    path('api/v1/get/new_film/', GetNewFilmView.as_view()),

    # 获取最热影片（分页）
    path('api/v1/get/hot_film/', GetHotFilmView.as_view()),

    # 随机获取返回前5个影片
    path('api/v1/get/guessfilm/', GetGuessFilmView.as_view()),

    # 模糊查询接口（用户搜索）（分页）
    path('api/v1/get/search/', GetSearchFilmView.as_view()),

    # 获取电影详情信息
    path('api/v1/get/filmdetail/', GetFilmDetailView.as_view()),

    # 用户注册
    path('register/', RegisterView.as_view()),

    # 用户登录（验证重复登录，生成JWT）
    path('login/', LoginView.as_view()),

    # 用户退出登录（验证JWT，删除JWT）
    path('login_out/', LoginOutView.as_view()),

    # 获取用户信息（验证JWT）
    path('api/v1/get/user_info/', GetUserInfoView.as_view()),

    # 局部更新信息（验证JWT）
    path('api/v1/user_info/', UserInfoView.as_view()),

    # 检查jwt是否过期（验证JWT）
    path('check_jwt/', CheckJWTView.as_view()),

    # 用户收藏电影（验证JWT）
    path('api/v1/interest_movie/', InterestMovie.as_view()),

    # 获取用户收藏的电影列表
    path('api/v1/my_interest_movie/', GetMyInterestFilmView.as_view()),

    # 获取浏览历史记录的电影
    path('api/v1/history_movie/', GetHIstoryFilmView.as_view()),
]
