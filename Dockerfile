FROM conduitdart/conduit:v5.1.1

COPY . $HOME/app/
WORKDIR $HOME/app/

RUN dart pub get --offline && conduit build .

CMD echo $HOSTNAME && ./conduit_app_test.aot