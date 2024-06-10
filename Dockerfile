FROM conduitdart/conduit:v5.1.2

COPY . $HOME/app/
WORKDIR $HOME/app/

RUN dart pub get --offline && conduit build --define=HOSTNAME=$HOSTNAME
RUN cat bin/main.dart

CMD ./conduit_app_test.aot