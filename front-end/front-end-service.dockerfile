FROM alpine:latest

RUN mkdir /app

COPY frontApp /app

RUN mkdir "/app/cmd/"

COPY cmd/web/templates/ /app/cmd/web/templates/

#RUN ls -la /app

CMD [ "/app/frontApp"]