# Generated by Django 2.2.5 on 2019-10-15 23:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('film', '0003_film_is_swiper'),
        ('user', '0002_user_jwt'),
    ]

    operations = [
        migrations.CreateModel(
            name='UserInterest',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('user', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='user.User', verbose_name='用户')),
            ],
            options={
                'verbose_name': '基本用户信息',
                'verbose_name_plural': '基本用户信息',
            },
        ),
        migrations.CreateModel(
            name='UserFilm',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('created_time', models.DateTimeField(auto_now_add=True, verbose_name='创建时间')),
                ('film', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='film.Film')),
                ('user', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='user.User')),
            ],
            options={
                'verbose_name': '用户关注的电影',
                'verbose_name_plural': '用户关注的电影',
            },
        ),
        migrations.AddField(
            model_name='user',
            name='interest_film',
            field=models.ManyToManyField(blank=True, null=True, through='user.UserFilm', to='film.Film', verbose_name='关注的电影'),
        ),
    ]
