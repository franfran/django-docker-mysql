from .settings import *

ALLOWED_HOSTS = ['localhost', '127.0.0.1']

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'django_dev',
        'USER': 'root',
        'PASSWORD': 'password',
        'HOST': 'db_1',
        'PORT': '3306',
    }
}
