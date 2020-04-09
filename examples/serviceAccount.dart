import 'dart:io';

import 'package:gcputils/auth_utils.dart';
import 'package:googleapis/storage/v1.dart' as gcs;

void main(List<String> args) async {

  const project = "flutter-273418";

  final scopes = [gcs.StorageApi.DevstorageReadOnlyScope];
  
  final credentials = File(args[0]).readAsStringSync();

  final client = await getClientFromServiceAccount(credentials, scopes);

  final storageApi = gcs.StorageApi(client);

  storageApi.buckets.list(project).then((buckets){
    for(final element in buckets.items){
      print(element.name);
    }
  });
}