# Not, before running this script you must set a GITHUB_TOKEN as environment variable. See https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry

echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
TAG=$(git describe)

make build
cp /etc/ssl/certs/ca-certificates.crt ca-certificates.crt
docker build . -t ghcr.io/block-markets-africa/external-dns:$TAG
docker push ghcr.io/block-markets-africa/external-dns:$TAG