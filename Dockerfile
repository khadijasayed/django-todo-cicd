FROM python:3

WORKDIR /data

RUN pip install --no-cache-dir "django>=4.2"

COPY . .

RUN mkdir -p /data/db

EXPOSE 8000

CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
