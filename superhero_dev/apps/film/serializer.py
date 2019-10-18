from django.contrib.auth.models import User

from rest_framework import serializers

from .models import Film, Actor, Poster


class ActorSerializer(serializers.ModelSerializer):
    created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    status = serializers.SerializerMethodField('get_status')

    class Meta:
        model = Actor
        fields = (
            'id', 'name', 'desc', 'photo', 'status', 'created_time'
        )

    def get_status(self, obj):
        return '200'


class PostSerializer(serializers.ModelSerializer):
    status = serializers.SerializerMethodField('get_status')
    created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)

    class Meta:
        model = Poster
        fields = (
            'id', 'poster', 'status', 'created_time'
        )

    def get_status(self, obj):
        return '200'


class FilmSerializer(serializers.ModelSerializer):
    # created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    release_date = serializers.DateTimeField(format="%Y-%m-%d", required=False, read_only=True)
    status = serializers.SerializerMethodField('get_status')
    # poster = PostSerializer(many=True, read_only=True)
    # actor = ActorSerializer(many=True, read_only=True)

    class Meta:
        model = Film
        fields = (
            'id', 'name', 'cover', 'score', 'prised_count', 'is_hot', 'status',
            'basic_info', 'release_date', 'release_place'
        )

        # fields = (
        #         #     'id', 'name', 'cover', 'trailer', 'score', 'prised_count', 'poster',
        #         #     'basic_info', 'original_name', 'release_date', 'release_place', 'total_time',
        #         #     'plot_desc', 'directors', 'actor', 'is_hot', 'created_time', 'status'
        #         # )

    def get_status(self, obj):
        return '200'


class FilmDetailSerializer(serializers.ModelSerializer):
    created_time = serializers.DateTimeField(format="%Y-%m-%d %H:%M:%S", required=False, read_only=True)
    release_date = serializers.DateTimeField(format="%Y-%m-%d", required=False, read_only=True)
    status = serializers.SerializerMethodField('get_status')
    poster = PostSerializer(many=True, read_only=True)
    actor = ActorSerializer(many=True, read_only=True)

    class Meta:
        model = Film
        fields = (
            'id', 'name', 'cover', 'trailer', 'score', 'prised_count', 'poster',
            'basic_info', 'original_name', 'release_date', 'release_place', 'total_time',
            'plot_desc', 'directors', 'actor', 'is_hot', 'created_time', 'status'
        )

    def get_status(self, obj):
        return '200'


class SwiperSerializer(serializers.ModelSerializer):
    status = serializers.SerializerMethodField('get_status')

    class Meta:
        model = Film
        fields = (
            'id', 'swiper_img', 'status'
        )

    def get_status(self, obj):
        return '200'











