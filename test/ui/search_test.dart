// lib/test/repository_provider_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:repository_search/view/pages/search_pege.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import '../mock/repository_provider.mocs.mocks.dart'; // モックをインポート

void main() {
  testWidgets('Search form triggers search on submitted text', (WidgetTester tester) async {
    // モックされたRepositoryProviderを準備
    final mockRepositoryProvider = MockRepositoryProvider();

    // モックの振る舞いを定義 (リポジトリが読み込まれていない状態)
    when(mockRepositoryProvider.loading).thenReturn(false);
    when(mockRepositoryProvider.repositories).thenReturn([]);

    // SearchPageをテスト環境にレンダリング
    await tester.pumpWidget(
      ChangeNotifierProvider<RepositoryProvider>(
        create: (_) => mockRepositoryProvider,
        child: const MaterialApp(home: SearchPage()),
      ),
    );

    // 検索フィールドにテキストを入力してエンターを押す
    await tester.enterText(find.byType(TextField), 'flutter');
    await tester.testTextInput.receiveAction(TextInputAction.done);

    // searchメソッドが呼び出されたことを確認
    verify(mockRepositoryProvider.search('flutter')).called(1);
  });
}

