import 'package:gcputils/auth_utils.dart' as auth_utils;
import 'package:gcputils/pubsub_utils.dart' as pubsub_utils;
import 'dart:io';

/// Example to show usage of publishPubsubMessage function.
/// 
/// To run this, you can do the following:
/// 
/// *dart pubsub_publish.dart <path-to-credentials-json-file> <project-id> <topic>*
void main(List<String> args) async {
  final pathToCredentials = args[0];
  final project = args[1];
  final topic = args[2];

  const scopes = [auth_utils.PUBSUB_SCOPE];
  
  final credentials = File(pathToCredentials).readAsStringSync();

  final client = await auth_utils.getClientFromServiceAccount(credentials, scopes);

  pubsub_utils.publishPubsubMessage(client, project, topic,
    data: "This is a test message",
    attributes: {"publisher": "fpllcr", "timestamp": DateTime.now().toString()}
  );
}