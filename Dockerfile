FROM metabrainz/base-image

ARG CT_VERSION="0.18.5"
ARG CT_RELEASE="consul-template_${CT_VERSION}_linux_amd64.zip"

RUN curl -O https://releases.hashicorp.com/consul-template/$CT_VERSION/$CT_RELEASE && \
    unzip -d /usr/local/bin $CT_RELEASE && \
    chmod 755 /usr/local/bin/consul-template && \
    rm -rf $CT_RELEASE /var/lib/apt/lists/*

COPY run-consul-template /usr/local/bin/

RUN chmod 755 /usr/local/bin/run-consul-template
