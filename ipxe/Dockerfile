FROM alpine AS build-stage

COPY boot.ipxe /src/boot.ipxe
ENV IPXE_VERSION v1.21.1

RUN apk add build-base git make perl xz-dev \
  && git clone https://github.com/ipxe/ipxe.git \
  && cd ipxe/src git checkout ${IPXE_VERSION} \
  && make EMBED=/src/boot.ipxe bin/ipxe.pxe bin-x86_64-efi/ipxe.efi \
  && cp bin/ipxe.pxe /src/ipxe.pxe \
  && cp bin-x86_64-efi/ipxe.efi /src/ipxe.efi

FROM scratch AS export-stage
COPY --from=build-stage /src/ipxe.pxe /
COPY --from=build-stage /src/ipxe.efi /
