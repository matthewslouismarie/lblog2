FROM python:3.7-alpine

RUN adduser -D lblog2user
RUN mkdir /home/lblog2user/lblog2app
WORKDIR /home/lblog2user/lblog2app
COPY boot.sh boot.sh
COPY lblog2.py lblog2.py
RUN chown -R lblog2user: .
USER lblog2user
RUN chmod +x ./boot.sh
RUN python -m venv venv
RUN venv/bin/pip install gunicorn flask
ENV FLASK_APP lblog2.py

ENTRYPOINT ["./boot.sh"]