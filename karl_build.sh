make build
cp /etc/ssl/certs/ca-certificates.crt ca-certificates.crt
docker build . -t kschriek/external-dns:latest
docker push kschriek/external-dns:latest