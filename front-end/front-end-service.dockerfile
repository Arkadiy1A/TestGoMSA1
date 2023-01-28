FROM alpine:latest

RUN mkdir /app

COPY frontApp /app

RUN mkdir "/app/cmd/"

CMD [ "/app/frontApp"]