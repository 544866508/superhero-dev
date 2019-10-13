from rest_framework import serializers
import jwt, datetime

from .models import User, OtherInfo
from utils.JWTutils import createJWT


class OtherINfoSerializer(serializers.ModelSerializer):
    birthday = serializers.DateTimeField(format="%Y-%m-%d", required=False, read_only=True)

    class Meta:
        model = OtherInfo
        fields = (
            'sex', 'birthday', 'say_sth',
        )


class UserSerializer(serializers.ModelSerializer):
    created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    status = serializers.SerializerMethodField('get_status')
    other_info = OtherINfoSerializer(read_only=True)

    class Meta:
        model = User
        fields = (
            'id', 'username', 'password', 'nickname', 'face', 'created_time', 'status', 'other_info'
        )

    def get_status(self, obj):
        return '200'


class LoginSerializer(UserSerializer):
    auth_token = serializers.SerializerMethodField('get_auth_token')

    class Meta:
        model = User
        fields = (
            'id', 'username', 'password', 'nickname', 'face', 'created_time', 'status', 'other_info',
            'auth_token'
        )

    # 生成JWT
    def get_auth_token(self, obj):
        # 传入用户model，返回jwt
        return createJWT(obj)
