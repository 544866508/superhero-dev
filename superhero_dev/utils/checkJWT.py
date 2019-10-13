import datetime

from jsonpickle import json

from apps.user.models import User
import jwt


def checkJWT(request):
    """
    作用：1.验证传入JWT是否合法（防止跨域请求伪造）
    变量：request
    """
    # 获取验证用户时所需要的信息（JWT和当前用户secret_key）
    encoded_jwt = request.META.get("HTTP_AUTH_TOKEN")
    user_id = request.data.get('user_id', 0)
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
    作用：1.检查用户当前是否存在JWT（判断用户是否首次登录）
          2.验证用户当前JWT是否过期（防止用户重复登录）
    变量：request
    """
    jwt_end_time = user.jwt_end_time
    # 用户当前jwt存在
    if jwt_end_time:
        print("存在")
        now = datetime.datetime.utcnow()
        # 用户当前jwt过期，则用户未登录，此时认为用户是重新登录
        if user.jwt_end_time < now:
            return True
        # 用户当前jwt未过期，则用户在线，此时认为用户是重复登录
        else:
            return False
    # 用户当前jwt不存在，此时认为用户是首次登录
    else:
        print("不存在")
        return True



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