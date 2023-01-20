FROM alpine:latest

RUN mkdir /app

COPY frontApp /app

RUN mkdir "/app/cmd/"

COPY cmd/web/templates/base.layout.gohtml /app/cmd/web/templates/
COPY cmd/web/templates/footer.partial.gohtml /app/cmd/web/templates/
COPY cmd/web/templates/header.partial.gohtml /app/cmd/web/templates/
COPY cmd/web/templates/test.page.gohtml /app/cmd/web/templates/
COPY cmd/web/templates/test.page2.gohtml /app/cmd/web/templates/

CMD [ "/app/frontApp"]