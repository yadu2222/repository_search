import 'api_client.dart';
import '../data/models/req_model.dart';
import '../data/models/repository_model.dart';
import '../core/constans/api_endpoints.dart';

class GithubRepository {
  Future<List<Repository>> getRepositories(String keywords) async {
    try {
      String query = '$keywords+in:name&sort=stars';
      Request reqData = Request(
        reqType: 'GET',
        url: ApiEndpoints.searchRepository,
        queryParams: {
          'q': query,
        },
      );
      final response = await HttpReq.httpReq(reqData);
      return Repository.resToList(response['items']);
    } catch (e) {
      throw Exception(e);
    }
  }
}
