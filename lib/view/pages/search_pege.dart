import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:repository_search/data/models/repository_model.dart';
import 'package:repository_search/view/components/organisms/repository_list.dart';
import 'package:repository_search/view/pages/detail_page.dart';
import 'package:repository_search/view/providers/repository_porivider.dart';
import '../components/templates/basic_template.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  final String title = 'GitHubリポジトリ検索';
  final String hintText = 'リポジトリ名を入力してください';
  final String snackBarText = '検索ワードを入力してください';

  @override
  Widget build(BuildContext context) {
    // 遷移
    void transition(Repository repository) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => (DetailPage(repository: repository))),
      );
    }
    return MediaQuery.of(context).orientation == Orientation.portrait
        // 縦向き
        ? BasicTemplate(
            title: title,
            children: [
              // 検索フォーム
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: hintText,
                    border:const OutlineInputBorder(),
                  ),
                  onSubmitted: (String value) {
                    if (value.isNotEmpty) {
                      context.read<RepositoryProvider>().search(value); // Providerからインスタンスを取得し、searchメソッドを呼び出す
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snackBarText)));
                    }
                  },
                ),
              ),
              // リポジトリリスト
              Consumer<RepositoryProvider>(
                builder: (context, provider, child) {
                  if (provider.loading) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Expanded(child: RepositoryList(repositories: provider.repositories, onTap: transition));
                  }
                },
              ),
            ],
          )
        // 横向き
        : BasicTemplate(
            title: title,
            portrait: false,
            children: [
              // 検索フォーム
              Column(children: [
                Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: hintText,
                      border: const OutlineInputBorder(),
                    ),
                    onSubmitted: (String value) {
                      if (value.isNotEmpty) {
                        context.read<RepositoryProvider>().search(value); // Providerからインスタンスを取得し、searchメソッドを呼び出す
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(snackBarText)));
                      }
                    },
                  ),
                ),
              ]),
              // リポジトリリスト
              Consumer<RepositoryProvider>(
                builder: (context, provider, child) {
                  if (provider.loading) {
                    return const Expanded(child: Center(child: CircularProgressIndicator())); // 検索バーを除いた部分の真ん中にローディングを表示
                  } else {
                    return Expanded(
                        child: RepositoryList(
                      repositories: provider.repositories,
                      onTap: transition,
                    ));
                  }
                },
              ),
            ],
          );
  }
}
