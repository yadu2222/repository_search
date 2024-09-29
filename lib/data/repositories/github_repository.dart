import '../../../network/github_api_service.dart';
import '../models/repository_model.dart';
import '../../../network/api_client.dart';

class GithubRepository {
  static Future<List<Repository>> getRepositories(String keywords) async {
    try{
      List<Repository> result = await GithubApiService(HttpReq()).getRepositories(keywords);
      return result;
    } catch(e) {
      throw Exception(e);
    }
  }
}