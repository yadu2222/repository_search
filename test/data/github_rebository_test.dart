import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/core/constans/api_endpoints.dart';
import 'package:repository_search/data/models/req_model.dart' as reqModel; // エイリアスを使用
import 'package:repository_search/network/github_api_service.dart'; // 確認
import '../mock/api_client.mocs.mocks.dart'; // 確認

void main() {
  reqModel.Request mockReq = reqModel.Request(reqType: 'GET', url: ApiEndpoints.searchRepository, queryParams: {'q': 'flutter+in:name&sort=stars'});

  // うまく動きませんでした。どうしてなのか辿り着けなかったため教えていただけると助かります
  group('GitHubRepository Tests', () {
    late MockHttpReq mockHttpReq;
    late GithubApiService repository;

    setUp(() {
      mockHttpReq = MockHttpReq();
      repository = GithubApiService(mockHttpReq);
    });

    test('getRepositories', () async {
      final mockResponse = {
        'items': [
          {
            'id': 1,
            'name': 'flutter',
            'owner': {'avatar_url': 'https://example.com/avatar.png', 'html_url': 'https://example.com'},
            'language': 'Dart',
            'stargazers_count': 1000,
            'watchers_count': 1000,
            'forks': 500,
            'open_issues': 10,
            'html_url': 'https://example.com',
          }
        ]
      };

      when(mockHttpReq.httpReq(any)).thenAnswer((_) async => mockResponse);
      final result = await repository.getRepositories('flutter');

      expect(result.length, 1);
      expect(result[0].repositoryName, 'flutter');
      expect(result[0].repositoryOwner, 'https://example.com/avatar.png');
      expect(result[0].langage, 'Dart');
      expect(result[0].numberOfStars, 1000);
      expect(result[0].numberOfWatchers, 1000);
      expect(result[0].numberOfForks, 500);
      expect(result[0].openIssues, 10);
      expect(result[0].repositoryUrl, 'https://example.com');
      expect(result[0].ownerUrl, 'https://example.com');

      verify(mockHttpReq.httpReq(mockReq)).called(1);
    });

    test('失敗をスロ−しました', () async {
      when(mockHttpReq.httpReq(mockReq)).thenThrow(Exception('API error'));
      expect(() => repository.getRepositories('flutter'), throwsException);
    });
  });
}
