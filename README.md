# gcputils
Using Google Cloud Platform services in Dart language.

## Authentication

### Using a service account
Source: https://github.com/fpllcr/gcputils/blob/master/lib/auth_utils.dart

Use **getClientFromServiceAccount** in order to get an AutorefreshingAuthClient from a specific service account. You can get the GCP service account credentials from https://console.cloud.google.com/iam-admin/serviceaccounts.

~~~
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

*See an example: https://github.com/fpllcr/gcputils/blob/master/examples/serviceAccount.dart*
