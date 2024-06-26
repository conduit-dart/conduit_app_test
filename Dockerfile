FROM conduitdart/conduit:v5.1.3

COPY . $HOME/app/
WORKDIR $HOME/app/

RUN dart pub get --offline

CMD conduit build --define=HOSTNAME=$HOSTNAME . && ./conduit_app_test.aot