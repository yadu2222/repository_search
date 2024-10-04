import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/core/constans/api_endpoints.dart';
import '../../lib/data/models/req_model.dart';
import '../../lib/network/api_client.dart';
import '../../lib/network/github_api_service.dart';

// HttpReq クラスのモック
class MockHttpReq extends Mock implements HttpReq {}

void main() {
  Request mockReq = Request(reqType: 'GET', url: ApiEndpoints.searchRepository, queryParams: {'q': 'flutter+in:name&sort=stars'});
  group('GitHubRepository Tests', () {
    late MockHttpReq mockHttpReq;
    late GithubApiService repository;

    setUp(() {
      mockHttpReq = MockHttpReq();
      repository = GithubApiService(mockHttpReq);
    });

    test('getRepositories', () async {
      // モックレスポンスデータ
      final mockResponse = {
        'items': [
          {
            'id': 1,
            'name': 'flutter',
            'owner': {'avatar_url': 'https://example.com/avatar.png','html_url': 'https://example.com'},
            'language': 'Dart',
            'stargazers_count': 1000,
            'watchers_count': 1000,
            'forks_count': 500,
            'open_issues_count': 10,
            'html_url': 'https://example.com',
          }
        ]
      };

      // モックのHttpReqが成功時にモックレスポンスを返すよう設定
      when(mockHttpReq.httpReq(any)).thenAnswer((_) async => mockResponse);

      // 実際にリポジトリのメソッドを呼び出す
      final result = await repository.getRepositories('flutter');

      // 検証
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

      // モックが1回だけ呼ばれたことを確認
      verify(mockHttpReq.httpReq(mockReq)).called(1);
    });

    test('失敗をスロ−しました', () async {
      // モックのHttpReqが失敗時にエラーをスローするよう設定
      when(mockHttpReq.httpReq(mockReq)).thenThrow(Exception('API error'));

      // エラーハンドリングのテスト
      expect(() => repository.getRepositories('flutter'), throwsException);
    });
  });
}
