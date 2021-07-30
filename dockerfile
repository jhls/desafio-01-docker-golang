FROM golang:alpine AS stage

WORKDIR /go/src/app
COPY . .
RUN go build main.go
CMD ["./main"]

FROM scratch

WORKDIR /go/src/app
COPY --from=stage /go/src/app .
CMD ["./main"]