bind = '127.0.0.1:{{ app_port }}'
workers = 3
accesslog = '/home/shoremonitor/logs_gunicorn/access.log'
errorlog = '/home/shoremonitor/logs_gunicorn/error.log'
