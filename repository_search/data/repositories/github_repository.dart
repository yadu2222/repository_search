import '../models/repository_model.dart';

class GithubRepository {
  static Future<List<Repository>> getRepositories(String keywords) async {
    try{
      List<Repository> result = await GithubRepository.getRepositories(keywords);
      return result;
    } catch(e) {
      throw Exception(e);
    }
  }
}