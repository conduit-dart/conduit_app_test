FROM conduitdart/conduit:v5.1.2

COPY . $HOME/app/
WORKDIR $HOME/app/

RUN dart pub get --offline && conduit build --define=HOSTNAME=$HOSTNAME .

CMD echo $HOSTNAME && ./conduit_app_test.aot