import 'package:conduit_app_test/conduit_app_test.dart';

Future main() async {
  const hostname = String.fromEnvironment('HOSTNAME');

  final addresses =
      await InternetAddress.lookup(hostname, type: InternetAddressType.IPv4);
  final app = Application<ConduitAppTestChannel>()
    ..options.address = addresses.firstWhere((a) => a.address != '127.0.0.1')
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
