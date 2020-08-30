from golang:1.14-buster as build
copy . .
run GOOS=linux GOARCH=amd64 go build -o /usr/local/bin/hello ./main.go

from scratch
copy --from=build /usr/local/bin/hello /hello
entrypoint [ "/hello" ]
