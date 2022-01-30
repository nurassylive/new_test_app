import '../../services/api_service.dart';
import '../../shared/endpoints.dart';

abstract class Repo {
  Future<List<dynamic>> getData(Endpoints endpoint);
}

class MainRepo extends Repo {
  final ApiService _apiService = ApiService();

  @override
  Future<List<dynamic>> getData(Endpoints endpoint) async {
    final response = await _apiService.getData(
      endpoint.buildURL(),
    );
    return response.data;
  }
}
