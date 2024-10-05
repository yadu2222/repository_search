import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import 'package:repository_search/view/pages/search_pege.dart';
import '../mock/repository_provider.mocs.mocks.dart'; // モックをインポート

void main() {
  // ローディング中の表示確認
  testWidgets('SearchPage shows loading indicator when loading', (WidgetTester tester) async {
    // モックプロバイダーを作成
    final mockProvider = MockRepositoryProvider();
    when(mockProvider.loading).thenReturn(true);

    // SearchPageをレンダリング
    await tester.pumpWidget(
      ChangeNotifierProvider<RepositoryProvider>(
        create: (_) => mockProvider,
        child: const MaterialApp(home: SearchPage()),
      ),
    );

    // ローディングインジケーターが表示されているか確認
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
