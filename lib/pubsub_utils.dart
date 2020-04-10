import 'package:googleapis_auth/auth_io.dart';
import 'package:googleapis/pubsub/v1.dart' as pubsub;
import 'dart:convert';

/// Publish a message in a Pub/Sub topic.
/// 
/// Required parameters:
/// 
/// [client] - Authenticated client. For example obtained from getClientFromServiceAccount function.
/// 
/// [project] - Project ID that contains the Pub/Sub topic
/// 
/// [topic] - Topic ID
/// 
/// Optional parameters. At least on of them is required:
/// 
/// [data] - Message content
/// 
/// [attributes] - Metadata
/// 
/// It returns a PublishResponse object and null in case of failure.
/// 
/// See example https://github.com/fpllcr/gcputils/blob/master/example/pubsub_publish.dart
pubsub.PublishResponse publishPubsubMessage(AuthClient client, String project, String topic,
  {String data = "", Map<String,String> attributes = const {}}) {
  
  final pubsubApi = pubsub.PubsubApi(client);

  final Map<String,dynamic> message = {
    'messages': [
      {
        'data': base64Encode(utf8.encode(data)),
        'attributes': attributes
      }
    ]
  };

  final request = pubsub.PublishRequest.fromJson(message);

  pubsub.PublishResponse publishResponse = null;

  pubsubApi.projects.topics.publish(request, "projects/$project/topics/$topic").
    then((response) {
      print('Successfully published. Message ID: ${response.messageIds[0]}');
      publishResponse = response;
    }).
    catchError((e) {
      print('Error while publishing: $e');
    });

  return publishResponse;

}