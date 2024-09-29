// lib/providers/repository_provider.dart
import 'package:flutter/material.dart';
import '../../data/models/repository_model.dart';
import '../../data/repositories/github_repository.dart';

class RepositoryProvider with ChangeNotifier {

  List<Repository> _repositories = [];  // リポジトリのリスト
  bool _loading = false;  // ローディング中かどうか

  // getter
  List<Repository> get repositories => _repositories;
  bool get loading => _loading; 

  // 検索処理
  Future<void> search(String query) async {
    _loading = true;
    notifyListeners();  // 処理の開始を通知

    _repositories = await GithubRepository.getRepositories(query);  // リポジトリの検索処理を呼び出し
    
    _loading = false;
    notifyListeners();  // 処理の終了を通知
  }
}
