import 'package:googleapis_auth/auth_io.dart' as auth;

/// Gets service account client from credentials
/// [required]
///   - String credentials: credentials obtained from https://console.cloud.google.com/iam-admin/serviceaccounts
///   - List<String> scopes: service scopes. For example StorageApi.DevstorageReadOnlyScope, PubsubApi.PubsubScope, etc.
/// 
/// See example in https://github.com/fpllcr/gcputils/blob/master/examples/serviceAccount.dart
Future<auth.AutoRefreshingAuthClient> getClientFromServiceAccount(final String credentials, final List<String> scopes) async {
  final accountCredentials = auth.ServiceAccountCredentials.fromJson(credentials);

  final client = await auth.clientViaServiceAccount(accountCredentials, scopes);

  return client;
}