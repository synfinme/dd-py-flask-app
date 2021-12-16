FROM python:alpine3.14

RUN pip install Flask ddtrace

RUN mkdir -p /opt/scripts

COPY flask-app.py /opt/scripts/flask-app.py

WORKDIR /home

ENTRYPOINT ["/opt/scripts/flask-app.py"]
