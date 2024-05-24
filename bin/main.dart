import 'package:conduit_app_test/conduit_app_test.dart';

Future main() async {
  final hostname = Platform.environment['HOSTNAME'] ?? 'localhost';
  print('Resolving hostname $hostname');
  final addresses =
      await InternetAddress.lookup(hostname, type: InternetAddressType.IPv4);
  print('Hostname resolves to $addresses');
  final app = Application<ConduitAppTestChannel>()
    ..options.address = addresses.first
    ..options.configurationFilePath = "config.yaml"
    ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
