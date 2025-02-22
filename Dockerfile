FROM golang:latest AS build

WORKDIR /go/src/app
COPY . .
ENV CGO_ENABLED=0

RUN make build

FROM scratch
COPY --from=build /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/
COPY --from=build /go/src/app/bin/mosquitto-exporter /mosquitto_exporter

EXPOSE 9234

ENTRYPOINT [ "/mosquitto_exporter" ]
