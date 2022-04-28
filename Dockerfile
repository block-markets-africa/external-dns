FROM amd64/alpine:3.15

COPY ca-certificates.crt /etc/ssl/certs/ca-certificates.crt
COPY build/external-dns /bin/external-dns

# Run as UID for nobody since k8s pod securityContext runAsNonRoot can't resolve the user ID:
# https://github.com/kubernetes/kubernetes/issues/40958
USER 65534

ENTRYPOINT ["/bin/external-dns"]
