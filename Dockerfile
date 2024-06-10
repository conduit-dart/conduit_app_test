FROM conduitdart/conduit:v5.1.2

COPY . $HOME/app/
WORKDIR $HOME/app/

RUN dart pub get --offline && conduit build --define=HOSTNAME=$HOSTNAME
RUN chmod +x wait-for-it.sh

CMD  ./wait-for-it.sh $HOSTNAME ./conduit_app_test.aot