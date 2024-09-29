import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import '../components/templates/basic_template.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicTemplate(
      title: 'GitHubリポジトリ検索',
      children: [
        // 検索フォーム
        Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'リポジトリ名を入力してください',
              border: OutlineInputBorder(),
            ),
            onSubmitted: (String value) {
              context.read<RepositoryProvider>().search(value); // Providerからインスタンスを取得し、searchメソッドを呼び出す
            },
          ),
        ),
        // リポジトリリスト
        Consumer<RepositoryProvider>(
          builder: (context, provider, child) {
            if (provider.loading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Expanded(
                child: ListView.builder(
                  itemCount: provider.repositories.length,
                  itemBuilder: (context, index) {
                    final repository = provider.repositories[index];
                    return ListTile(
                      title: Text(repository.repositoryName),
                    );
                  },
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
