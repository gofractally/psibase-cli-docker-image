ARG VERSION
FROM ghcr.io/gofractally/psinode:$VERSION as base

# Remove unneeded items from the image
RUN cd /opt/psidk-ubuntu-2004/bin            \
    && rm psinode \
    && cd /usr/local/bin \
    && rm psinode* \
    && cd /root \
    && rm -rf psinode

# Squash layers
FROM ubuntu:20.04
COPY --from=base / /

ENV PSIDK_HOME=/opt/psidk-ubuntu-2004
ENV PATH=$PSIDK_HOME/bin:$PATH

LABEL org.opencontainers.image.title="Psibase-CLI_Ubuntu-20.04" \
    org.opencontainers.image.description="This docker image provides access to the Psibase CLI tool for local or remote administration of a Psinode instance." \
    org.opencontainers.image.vendor="Fractally LLC" \
    org.opencontainers.image.url="https://github.com/gofractally/psibase-cli-image" \
    org.opencontainers.image.documentation="https://doc-sys.psibase.io/psibase/index.html"

ENTRYPOINT ["psibase"]

# psibase boot -p myproducer --no-doc
