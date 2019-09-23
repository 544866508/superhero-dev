from django.contrib import admin
from .models import Film, Actor, Poster, FilmActor


@admin.register(Poster)
class PosterAdmin(admin.ModelAdmin):
    list_display = ('film', 'poster', 'created_time')
    fields = ('film', 'poster')


class ActorInline(admin.TabularInline):
    model = Film.actor.through
    extra = 0
    verbose_name = 'actor'
    verbose_name_plural = verbose_name


class PosterInline(admin.TabularInline):
    model = Poster
    extra = 0
    verbose_name = 'poster'
    verbose_name_plural = verbose_name


@admin.register(Film)
class FilmAdmin(admin.ModelAdmin):
    list_display = ('name', 'cover', 'trailer', 'score', 'prised_count', 'is_hot',
                    'basic_info', 'original_name', 'release_date', 'release_place',
                    'total_time', 'plot_desc', 'directors', 'created_time')
    # fields = ('name', 'cover', 'trailer', 'score', 'prised_count', 'is_hot',
    #                 'basic_info', 'original_name', 'release_date', 'release_place',
    #                 'total_time', 'plot_desc', 'directors')
    fieldsets = (
        ('基本信息', {
            'description': '影片信息',
            'fields': (
                'name', 'cover', 'trailer', 'score', 'prised_count', 'is_hot',
                'basic_info', 'original_name', 'release_date', 'release_place',
                'total_time', 'plot_desc', 'directors'
            )
        }),
    )
    filter_vertical = ('actor', )

    inlines = [ActorInline, PosterInline, ]


@admin.register(Actor)
class ActorAdmin(admin.ModelAdmin):
    list_display = ('name', 'desc', 'photo', 'created_time')
    fields = ('name', 'desc', 'photo')


@admin.register(FilmActor)
class FilmActorAdmin(admin.ModelAdmin):
    list_display = ('actor', 'film', 'role', 'created_time')
    fields = ('actor', 'film', 'role')

