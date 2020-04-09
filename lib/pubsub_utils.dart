import 'package:googleapis/pubsub/v1.dart' as pubsub;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'dart:convert';

void main() {

  final accountCredentials = auth.ServiceAccountCredentials.fromJson(r'''
    {
      "type": "service_account",
      "private_key_id": "2660bfd3d44f108485c39ba81941469233f6a95a",
      "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCLK0FC9bbUKipx\ntWen8DTmeUWLXY8zsBGagkTa74tLLgb3LCOIG53FeewgSuqyb6yJiHyOcNXQ7u2B\nCwS+r/wz3/432qo8CGJd0hvtzzi7jXOhBizT4zb0CvQp78oKM/RA6Ytf/oPCP/c2\njO1Wr3+Kin+eVGMwFLZTUEykveILa7DulBCrZ0UJWKQ2xLdnHnAPgTz4rztuGy8N\nEEJMj59GVJg/Imm3mYe9biyCl7djY9SEoTiGM6ldJ++v/9ktUe0CGyZP4KRn6aMZ\n2GJHb9uygPI+IdpoP3ILIr6/Vyv68rlhsNtdtMEZYjLJ1k41hRLe6e2yiOkqK9+Z\nbZHN9S43AgMBAAECggEAB2I5BeMnTmdngn2HU977N4hf1IHKWyNjmhwaQh44Ejnz\n1af3J9c4DjLZs9CCiXGowlB5Z02v30EMXQhA7RffAvOThDjrE+DpmYrpv237Cq+T\neHIghvEE4kebsu2AsMmwrMPKiMIzETQ3Z6LSsgKarja97m0Rj1eYYTnSVZVB40aN\n5Vw6I3E02NyL+2si38XTjgQMfV+tfwmLzjYfZrtA7lNnl7Gpj3lnEM7SXhQYaeLB\n0qN8wRg5mm13P0pGjfPaa2k79Lk3duUOO3bmoWFJPSPCmLuknC6lkrDY2j0QDjHw\nurn3ELoGwKsvZnKEcm94i0A6HIMlTGUNHmXqUSKDPQKBgQDBbaulvS8M8AH+sR01\ncGBX/vQapE7pDweC/Bli5jLXDQ6a9GHH/+MvmaDZN0W3MMFVujG2CAMz9M66a93z\ndy7P8RbiL32YzffcrXvrTAoN4peJ1+p+kOrwpAv4fNyFpEzu8X54n5sDvlwgK92O\nE2uJctEzvwsGL5uNu3i5cpIIdQKBgQC4MDayCDStt3KbIPxxB47xW2t8vSlAtxHf\nXvmQ/jlKXTE0L8PYWChdHbi6HkePty7ncOhItNH71bhVNw/3aKOtxzgDC6YcX0dm\nAquxS0lW3MYnWFmN3+GPCQKPspQpPv4K8XW7EC9orihmFxj4E53R0NEwKs8dp5IK\np1i5HyrmewKBgQCPXDZU37OIljYUS7cHTWPKtGa9fDwUFhSOK0SxfUX/B2lkxW3X\nars6I1YIyCN+k78nR5nifWvKTU4O8zWMZjAm5Fv+hg5De5ySTW5DxZbKFcAU5Rei\neMv4UM2ifQCAeHagvhHrWvfsPWFQYtKRo6kXNScCgDyueAiFcoYWhGjhpQKBgAo/\nNGvHJRcdA5U5ypGHOB6ZVWuFIoxlIutoXz3/xrQqZxheJ+kbTnOPub0w/g4yxLs/\nfsy8sonuI+kpvQuomKKMWMNinIUrj89PCro8VAIvGh8KPUE1WVkZyTixWKjKxltZ\nf5E+n0SVm83CLzNt8/O+SEUDvK4LqoZJNRhncX2NAoGBAKIMKM1QjRP0URel5i+L\nS9eIGPQMajCoPhGqoBilAqvVkFMbOyew8+kLZ3aAy9XD2T9a4V9WVoAV+SAd5Qmp\nUImNKRtS+tYk1Cqk/hs7XvSzLJ/zT+0nVa/2067j/30cXLa8lX+RMRxVzGd5WzOL\nvO7EI//6UtGIMr3hGyM0RSpT\n-----END PRIVATE KEY-----\n",
      "client_email": "test-920@flutter-273418.iam.gserviceaccount.com",
      "client_id": "107716975493311351601"
    }
    ''');

  final scopes = [pubsub.PubsubApi.PubsubScope];

  auth.clientViaServiceAccount(accountCredentials, scopes).then((client) {
    var api = pubsub.PubsubApi(client);

    var messages = {
    'messages': [
                  {
                    'data': base64Encode(utf8.encode('{"foo": "bar"}')),
                  },
                ]
              };

    var publishRequest = pubsub.PublishRequest.fromJson(messages);

    api.projects.topics.publish(publishRequest, 'projects/flutter-273418/topics/dart_topic').then((response) => print(response.toString()));
  });

}