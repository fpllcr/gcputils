import 'dart:io';
import 'package:gcputils/auth_utils.dart';
import 'package:googleapis/storage/v1.dart' as gcs;

/// Example to show the usage of getClientFromServiceAccount function.
/// 
/// In this case, I pass my GCP project-id and my credentials json file as parameters to the main function.
/// Then, it's possible to use the different apis provided by the googleapis library.
/// 
/// For this example I list the buckets contained in the mentioned GCP project.
/// 
/// To run this, you can do the following:
/// 
/// *dart serviceAccount.dart <project-id> <path-to-credentials-json-file>*
void main(List<String> args) async {

  final project = args[0];

  final scopes = [gcs.StorageApi.DevstorageReadOnlyScope];
  
  final credentials = File(args[1]).readAsStringSync();

  final client = await getClientFromServiceAccount(credentials, scopes);

  final storageApi = gcs.StorageApi(client);

  storageApi.buckets.list(project).then((buckets){
    for(final element in buckets.items){
      print(element.name);
    }
  });
}