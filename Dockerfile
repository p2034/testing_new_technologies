# builder
FROM golang:alpine as builder

RUN apk add --update --no-cache make

WORKDIR /app

COPY . /app

RUN go mod download
RUN go mod vendor

RUN go build -o server.out

# runner
FROM alpine:latest as runner

COPY --from=builder /app/server.out .

EXPOSE 10001

ENTRYPOINT [ "./server.out" ]