# Build image to be discarded
FROM golang:latest as build

WORKDIR /go/src/web

COPY main.go .

RUN go build -a -installsuffix cgo -ldflags="-w -s" -o server main.go

# Minimal runtime image
FROM debian:stable-slim

WORKDIR /web

COPY static static/
COPY templates templates/

COPY --from=build /go/src/web/server .

ENTRYPOINT [ "/bin/bash", "-c", "/web/server \"$@\"", "--" ]
