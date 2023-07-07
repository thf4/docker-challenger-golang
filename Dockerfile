FROM golang:alpine as build
WORKDIR /usr/src/app
ADD . .
RUN go mod init pwd/main
RUN go build -ldflags '-s -w' main.go

FROM scratch
WORKDIR /
COPY --from=build /usr/src/app/main /
CMD ["./main"]