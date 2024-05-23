import 'package:conduit_app_test/conduit_app_test.dart';

Future main() async {
  final app = Application<ConduitAppTestChannel>()
    ..options.address =
        (await InternetAddress.lookup(Platform.environment['HOSTNAME'] ?? ''))
            .firstWhere((address) => address.address != '127.0.0.1')
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
