FROM ubuntu:latest
LABEL MAINTAINER="UiLgNoD-lIaMtOh <UiLgNoD.lIaMtOh@hotmail.com>"
ADD package /tmp/
RUN wget https://download-cdn.resilio.com/stable/linux/x64/0/resilio-sync_x64.tar.gz \
    -O"/tmp/sync.tar.gz" \
    ; tar xf /tmp/sync.tar.gz -C /usr/bin rslsync \
    ; mv -fv /tmp/sync.conf /etc/ \
    ; mv -fv /tmp/ResilioSyncPro.btskey /etc/ \
    ; mv -fv /tmp/run_sync /usr/bin/ \
    ; chmod -v +x /usr/bin/run_sync \
    ; rm -f /tmp/sync.tar.gz \
    ; mkdir -pv /mnt/sync

CMD ["run_sync","--config", "/mnt/sync/conf/sync.conf"]
