import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:repository_search/view/pages/search_pege.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import 'package:repository_search/data/models/repository_model.dart';
import '../mock/repository_provider.mocs.mocks.dart'; // モックをインポート

void main() {
  group('SearchPage Tests', () {
    late MockRepositoryProvider mockRepositoryProvider;

    setUp(() {
      mockRepositoryProvider = MockRepositoryProvider();
    });

    // UI要素が正しく表示されているか確認
    testWidgets('SearchPage shows search input and list', (WidgetTester tester) async {
      // モックプロバイダの初期状態
      when(mockRepositoryProvider.loading).thenReturn(false);
      when(mockRepositoryProvider.repositories).thenReturn([]);

      // SearchPageをレンダリング
      await tester.pumpWidget(
        ChangeNotifierProvider<RepositoryProvider>(
          create: (_) => mockRepositoryProvider,
          child: const MaterialApp(home: SearchPage()),
        ),
      );

      // 検索フォームが表示されているか確認
      expect(find.byType(TextField), findsOneWidget);
      // 検索リストが表示されているか確認
      expect(find.byType(Expanded), findsOneWidget);
    });

    // 検索が実行された場合の動作確認
    testWidgets('SearchPage triggers search on text input', (WidgetTester tester) async {
      when(mockRepositoryProvider.loading).thenReturn(false);
      when(mockRepositoryProvider.repositories).thenReturn([]);

      // SearchPageをレンダリング
      await tester.pumpWidget(
        ChangeNotifierProvider<RepositoryProvider>(
          create: (_) => mockRepositoryProvider,
          child: const MaterialApp(home: SearchPage()),
        ),
      );

      // 検索フィールドにテキストを入力してEnterを押す
      await tester.enterText(find.byType(TextField), 'flutter');
      await tester.testTextInput.receiveAction(TextInputAction.done);

      // searchメソッドが呼び出されたことを確認
      verify(mockRepositoryProvider.search('flutter')).called(1);
    });

    // ローディング中の表示確認
    testWidgets('SearchPage shows loading indicator when loading', (WidgetTester tester) async {
      when(mockRepositoryProvider.loading).thenReturn(true);

      // SearchPageをレンダリング
      await tester.pumpWidget(
        ChangeNotifierProvider<RepositoryProvider>(
          create: (_) => mockRepositoryProvider,
          child: const MaterialApp(home: SearchPage()),
        ),
      );

      // ローディングインジケーターが表示されているか確認
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    // リポジトリが表示されているか確認
    testWidgets('SearchPage displays repositories when available', (WidgetTester tester) async {
      when(mockRepositoryProvider.loading).thenReturn(false);
      when(mockRepositoryProvider.repositories).thenReturn([
        Repository(id: '1', repositoryName: 'Repo1', repositoryOwner: 'Owner1', langage: 'dart',numberOfStars: 1,numberOfForks: 1,numberOfWatchers: 1,openIssues: 1,repositoryUrl: 'url1',ownerUrl: 'url1'),
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
            ownerUrl: 'url2'),
      ]);

      // SearchPageをレンダリング
      await tester.pumpWidget(
        ChangeNotifierProvider<RepositoryProvider>(
          create: (_) => mockRepositoryProvider,
          child: const MaterialApp(home: SearchPage()),
        ),
      );

      // リポジトリの名前が表示されているか確認
      expect(find.text('Repo1'), findsOneWidget);
      expect(find.text('Repo2'), findsOneWidget);
    });
  });
}
