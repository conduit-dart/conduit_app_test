import 'package:conduit_app_test/conduit_app_test.dart';

Future main() async {
  const hostname = String.fromEnvironment('HOSTNAME');

  final addresses = await InternetAddress.lookup(hostname);
  final app = Application<ConduitAppTestChannel>()
    ..options.address = addresses.first
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
