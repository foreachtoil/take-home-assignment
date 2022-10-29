FROM golang:1.19 as builder

WORKDIR $GOPATH/src
EXPOSE 8080

ADD . .
RUN go env -w GO111MODULE=off
RUN go get -d github.com/go-sql-driver/mysql
RUN go build -o webserver ./dockerize/webserver.go
CMD ["./webserver"]
