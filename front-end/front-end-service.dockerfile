FROM alpine:latest

RUN mkdir /app

COPY frontApp /app

RUN mkdir "/app/cmd/"

COPY cmd/ /app/cmd/

RUN ls -la /app

CMD [ "/app/frontApp"]