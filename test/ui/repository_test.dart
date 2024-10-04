import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:repository_search/data/models/repository_model.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import 'package:repository_search/view/pages/search_pege.dart';
import '../mock/repository_provider.mocs.mocks.dart'; // モックをインポート

void main() {
  testWidgets('SearchPage displays repositories when available', (WidgetTester tester) async {
    // モックプロバイダーを作成
    final mockProvider = MockRepositoryProvider();
    
    // モックの動作を設定
    when(mockProvider.loading).thenReturn(false);
    when(mockProvider.repositories).thenReturn([
      Repository(
        id: '1',
        repositoryName: 'Repo1',
        repositoryOwner: 'Owner1',
        langage: 'dart',
        numberOfStars: 1,
        numberOfForks: 1,
        numberOfWatchers: 1,
        openIssues: 1,
        repositoryUrl: 'url1',
        ownerUrl: 'url1',
      ),
      Repository(
        id: '2',
        repositoryName: 'Repo2',
        repositoryOwner: 'Owner2',
        langage: 'go',
        numberOfStars: 1,
        numberOfForks: 1,
        numberOfWatchers: 1,
        openIssues: 1,
        repositoryUrl: 'url2',
        ownerUrl: 'url2',
      ),
    ]);

    // SearchPageをレンダリング
    await tester.pumpWidget(
      ChangeNotifierProvider<RepositoryProvider>(
        create: (_) => mockProvider,
        child: const MaterialApp(home: SearchPage()),
      ),
    );

    // ウィジェットが完全に描画されるのを待つ
    await tester.pumpAndSettle();

    // リポジトリの名前が表示されているか確認
    expect(find.text('Repo1'), findsOneWidget);
    expect(find.text('Repo2'), findsOneWidget);
  });
}

