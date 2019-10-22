# coding=utf-8
import datetime
from django.http import JsonResponse, QueryDict

from jsonpickle import json

from apps.user.models import User
import jwt


def saveJWT(user, JWT):
    """
    作用：保存JWT到当前用户
    变量：user
    """
    user.jwt = JWT
    user.save()


def createJWT(user):
    """
    作用：为用户生成JWT
    变量：user
    """
    # 头部（验证类型，验证方式）
    headers = {
        "typ": "JWT",
        "alg": "HS256",
    }

    # 中间（自定义数据）
    playload = {
        "headers": headers,
        "user_id": user.id,
        "user_name": user.username,
        "iss": 'zoe',  # 签发人
        "exp": datetime.datetime.utcnow() + datetime.timedelta(days=0, hours=1, minutes=0, seconds=0),  # 过期时间
        'iat': datetime.datetime.utcnow()  # jwt开始时间
    }

    secret_key = str(user.random)  # 秘钥
    # 尾部（签名）
    signature = jwt.encode(playload, secret_key, algorithm='HS256').decode('utf-8')
    saveJWT(user, signature)

    return signature


def deleteJWT(user):
    """
    作用：删除用户JWT
    变量：user
    """
    # 用户当前jwt存在
    if user.jwt:
        user.jwt = None
        user.save()


def checkJWT(request):
    """
    作用：1.验证传入JWT是否合法（防止跨域请求伪造）
    变量：request
    """
    # 获取验证用户时所需要的信息（JWT和当前用户secret_key）
    encoded_jwt = request.META.get("HTTP_AUTH_TOKEN")

    # 兼容两种id的获取方式
    user_id_post_put = request.data.get('user_id', 0)
    user_id_get_delete = request.GET.get('user_id', 0)

    user_id = user_id_post_put if (user_id_post_put != 0) else user_id_get_delete

    # print(encoded_jwt)
    # print(user_id_a)
    # print(user_id_b)
    # print(user_id)

    user = User.objects.filter(id=user_id)
    if user and encoded_jwt:
        user = user[0]
        secret_key = str(user.random)
        # 传入JWT和当前用户secret_key，验证用户身份
        try:
            # 解码jwt
            decode_jwt = jwt.decode(encoded_jwt, secret_key, algorithms=['HS256'])
            return decode_jwt
        except:
            return False
    # 用户id或JWT不存在
    return False


def checkOnlyUser(user):
    """
    说明：返回True说明用户没有重复登录，返回False说明用户重复登录
    作用：1.检查用户当前是否存在JWT（判断用户是否首次登录）
          2.验证用户当前JWT是否过期（防止用户重复登录）
    变量：user
    """
    user_jwt = user.jwt
    # 用户当前jwt存在
    if user_jwt:
        secret_key = str(user.random)
        # 传入JWT和当前用户secret_key，验证用户身份
        try:
            # 解码jwt
            decode_jwt = jwt.decode(user_jwt, secret_key, algorithms=['HS256'])
            if decode_jwt:
                return False    # 用户当前jwt未过期,重复登录
        except:
            return True    # 用户当前jwt已过期，不是重复登录
    # jwt不存在，不是重复登录
    else:
        return True


# 装饰器
def checkUserJWT(fn):
    """
    说明：此方法是checkJWT的装饰器方法
    作用：1.验证传入JWT是否合法（防止跨域请求伪造）
    变量：request
    """
    def wrapper(self, request):
        # 检查用户jwt是否过期
        if checkJWT(request):

            # before
            fn_res = fn(self, request)  # 执行被装饰的请求方法，必须携带self, request参数
            # after

            return fn_res
        else:
            context = {'status': '400', 'msg': '登录过期'}
            return JsonResponse(context)
    return wrapper









    # # jwt解码正确，合法请求。到此步，认为已经防止跨域请求伪造
    #         if decode_jwt["iat"]:
    #             decode_jwt_end_time = decode_jwt["iat"]
    #             # 用户当前jwt存在
    #             if user.jwt_end_time:
    #                 now = datetime.datetime.utcnow()
    #                 # 用户当前jwt过期，则用户未登录，此时认为用户是重新登录
    #                 if user.jwt_end_time < now:
    #                     # 将传入的jwt结束时间保存
    #                     user.jwt_end_time = decode_jwt_end_time
    #                     user.save()
    #                     return True
    #                 # 如果用户当前jwt未过期，则验证两个jwt结束时间是否相等
    #                 elif decode_jwt_end_time == user.jwt_end_time:
    #                     # 相等：是同一个用户，此时认为是单个用户进行的在线操作，返回true。到此步，认为已经防止用户重复登录
    #                     return True
    #                 else:
    #                     # 不等：两个jwt不同，用户重复登录
    #                     return False
    #             else:
    #                 # 用户当前jwt结束时间不存在，则为首次登录，将传入的jwt结束时间保存为用户当前jwt
    #                 user.jwt_end_time = decode_jwt_end_time
    #                 user.save()
    #                 return True
    #         # 解码失败，非法请求
    #         return False
    #     # 验证出现错误