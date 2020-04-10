# gcputils
Using Google Cloud Platform services in Dart language.

## Authentication
Source: https://github.com/fpllcr/gcputils/blob/master/lib/auth_utils.dart

### Using a service account
Use **getClientFromServiceAccount** in order to get an AutorefreshingAuthClient from a specific service account. You can get the GCP service account credentials from https://console.cloud.google.com/iam-admin/serviceaccounts.

~~~dart
import 'package:gcputils/auth_utils.dart' show getClientFromServiceAccount;
import 'package:googleapis/storage/v1.dart' as gcs;

const credentials = '''{
    "type": "service_account",
    "private_key_id": "<private_key_id>",
    "private_key": "-----BEGIN PRIVATE KEY-----<private_key>-----END PRIVATE KEY-----\n",
    "client_email": "<email>.iam.gserviceaccount.com",
    "client_id": "<client_id>"
}'''

List<String> scopes = [gcs.StorageApi.DevstorageReadOnlyScope];

final client = await getClientFromServiceAccount(credentials, scopes);

// Now you can use client to have access to GCP API's. For example:
final storageApi = gcs.StorageApi(client);
~~~

*See a complete example: https://github.com/fpllcr/gcputils/blob/master/example/serviceAccount.dart*

## Pub/Sub
What is Pub/Sub: https://cloud.google.com/pubsub/docs/overview
Source: https://github.com/fpllcr/gcputils/blob/master/lib/pubsub_utils.dart

### Publishing messages
Publish a message in a Pub/Sub topic. At least one of *data* or *attributes* must be specified.

~~~dart
  pubsub_utils.publishPubsubMessage(client, project, topic,
    data: "This is a test message",
    attributes: {"publisher": "fpllcr", "timestamp": DateTime.now().toString()}
  );
~~~

*See a complete example: https://github.com/fpllcr/gcputils/blob/master/example/pubsub_publish.dart*
