// lib/providers/repository_provider.dart
import 'package:flutter/material.dart';
import '../../data/models/repository_model.dart';
import '../../data/repositories/github_repository.dart';

class RepositoryProvider with ChangeNotifier {
  List<Repository> _repositories = []; // リポジトリのリスト
  bool _loading = false; // ローディング中かどうか

  // getter
  List<Repository> get repositories => _repositories;
  bool get loading => _loading;

  // setter
  set repositories(List<Repository> repositories) {
    _repositories = repositories;
    notifyListeners(); // リポジトリの更新を通知
  }

  set loading(bool value) {
    _loading = value;
    notifyListeners(); // ローディング状態の変更を通知
  }

  // 検索処理
  Future<void> search(String query) async {
    loading = true; // ローディング中に設定

    _repositories = await GithubRepository.getRepositories(query); // リポジトリの検索処理を呼び出し

    loading = false;
  }
}
