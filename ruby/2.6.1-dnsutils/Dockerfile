FROM ruby:2.6.1-stretch as ruby
RUN apt-get update -qq && apt-get install -y postgresql-client libgmp10-dev libgmp10 busybox dnsutil
FROM gcr.io/distroless/base

COPY --from=ruby ["/lib/x86_64-linux-gnu/liblzma*", \
        "/lib/x86_64-linux-gnu/libcom_err*", \
        "/lib/x86_64-linux-gnu/libkeyutils*", \
        "/lib/x86_64-linux-gnu/libgcc_s.so*", \
        "/lib/x86_64-linux-gnu/libidn.so*", \
        "/lib/x86_64-linux-gnu/libtinfo.so.5*", \
        "/lib/x86_64-linux-gnu/libncurses*", \
        "/lib/x86_64-linux-gnu/libreadline.so.7*", \
        "/lib/x86_64-linux-gnu/libjson-c.so.3*", \
        "/lib/x86_64-linux-gnu/libkeyutils.so*", \
        "/lib/x86_64-linux-gnu/liblzma.so*", \
        "/lib/x86_64-linux-gnu/libz.so.*", \
        "/lib/x86_64-linux-gnu/"]
COPY --from=ruby ["/usr/lib/x86_64-linux-gnu/libgmp*", \
     "/usr/lib/x86_64-linux-gnu/libbind9.so*", \
     "/usr/lib/x86_64-linux-gnu/libcrypto.so*", \
     "/usr/lib/x86_64-linux-gnu/libdns.so*", \
     "/usr/lib/x86_64-linux-gnu/libffi.so*", \
     "/usr/lib/x86_64-linux-gnu/libGeoIP.so*", \
     "/usr/lib/x86_64-linux-gnu/libgnutls.so*", \
     "/usr/lib/x86_64-linux-gnu/libgss*", \
     "/usr/lib/x86_64-linux-gnu/libgssapi_krb5.so*", \
     "/usr/lib/x86_64-linux-gnu/libhogweed.so*", \
     "/usr/lib/x86_64-linux-gnu/libicudata.so*", \
     "/usr/lib/x86_64-linux-gnu/libicuuc.so*", \
     "/usr/lib/x86_64-linux-gnu/libisccfg.so*", \
     "/usr/lib/x86_64-linux-gnu/libisc.so*", \
     "/usr/lib/x86_64-linux-gnu/libk5crypto*", \
     "/usr/lib/x86_64-linux-gnu/libkrb*", \
     "/usr/lib/x86_64-linux-gnu/libkrb5.so*", \
     "/usr/lib/x86_64-linux-gnu/libkrb5support.so*", \
     "/usr/lib/x86_64-linux-gnu/liblber-2.4*", \
     "/usr/lib/x86_64-linux-gnu/libldap*", \
     "/usr/lib/x86_64-linux-gnu/liblwres.so*", \
     "/usr/lib/x86_64-linux-gnu/libnettle.so*", \
     "/usr/lib/x86_64-linux-gnu/libp11-kit*", \
     "/usr/lib/x86_64-linux-gnu/libpq*", \
     "/usr/lib/x86_64-linux-gnu/libsasl2.so*", \
     "/usr/lib/x86_64-linux-gnu/libstdc++.so*", \
     "/usr/lib/x86_64-linux-gnu/libtasn1*", \
     "/usr/lib/x86_64-linux-gnu/libxml2.so*", \
     "/usr/lib/x86_64-linux-gnu/"]

COPY --from=ruby /usr/local/lib/ /usr/local/lib
COPY --from=ruby /usr/local/bin/ /usr/local/bin
ENV GEM_HOME="/usr/local/bundle"

CMD ["/usr/local/bin/ruby", "-v"]
