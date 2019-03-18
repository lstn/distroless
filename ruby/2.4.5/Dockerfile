FROM ruby:2.4.5-stretch as ruby
RUN apt-get update -qq && apt-get install -y postgresql-client libgmp10-dev libgmp10 
FROM gcr.io/distroless/base

COPY --from=ruby ["/lib/x86_64-linux-gnu/liblzma*", \
        "/lib/x86_64-linux-gnu/libcom_err*", \
        "/lib/x86_64-linux-gnu/libkeyutils*", \
        "/lib/x86_64-linux-gnu/libgcc_s.so*", \
        "/lib/x86_64-linux-gnu/libidn.so*", \
        "/lib/x86_64-linux-gnu/libtinfo.so.5*", \
        "/lib/x86_64-linux-gnu/libncurses*", \
        "/lib/x86_64-linux-gnu/libreadline.so.7*", \
        "/lib/x86_64-linux-gnu/libz.so.*", \
        "/lib/x86_64-linux-gnu/"]
COPY --from=ruby ["/usr/lib/x86_64-linux-gnu/libgmp*", \
     "/usr/lib/x86_64-linux-gnu/libgnutls.so*", \
     "/usr/lib/x86_64-linux-gnu/libgss*", \
     "/usr/lib/x86_64-linux-gnu/liblber-2.4*", \
     "/usr/lib/x86_64-linux-gnu/libldap*", \
     "/usr/lib/x86_64-linux-gnu/liblwres.so*", \
     "/usr/lib/x86_64-linux-gnu/libnettle.so*", \
     "/usr/lib/x86_64-linux-gnu/libp11-kit*", \
     "/usr/lib/x86_64-linux-gnu/libpq*", \
     "/usr/lib/x86_64-linux-gnu/libsasl2.so*", \
     "/usr/lib/x86_64-linux-gnu/libstdc++.so*", \
     "/usr/lib/x86_64-linux-gnu/libtasn1*", \
     "/usr/lib/x86_64-linux-gnu/libyaml*", \
     "/usr/lib/x86_64-linux-gnu/"]
COPY --from=ruby /usr/local/lib/ /usr/local/lib
COPY --from=ruby /usr/local/bin/ /usr/local/bin

CMD ["/usr/local/bin/ruby", "-v"]