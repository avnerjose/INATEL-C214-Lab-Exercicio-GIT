import 'package:ex2/controller/fetch_post.dart';
import 'package:ex2/model/post.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fetch_post_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  test("successfully returns a post", () async {
    final client = MockClient();

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
        .thenAnswer((_) async => (http.Response(
            '{ "userId": 1, "id": 1, "title": "mocked title", "body": "mocked body"}',
            200)));

    expect(await fetchPost(client), isA<Post>());
  });
test("throws exception when post is not found", () {
    final client = MockClient();

    when(client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts/1')))
        .thenAnswer((_) async => http.Response('Post not found', 404));

    expect(fetchPost(client), throwsException);
  })
  ;
}
