// ignore_for_file: avoid_print

import '../../shared/endpoints.dart';
import '../../services/api_service.dart';

class UserDetailsRepo {
  Future<Map<String, dynamic>> getDataById(int id) async {
    final response = await ApiService().getData(
      Endpoints.users.buildURL(),
      queryParameters: {'id': id},
    );
    // print('response: ${response.data}');
    return (response.data as List<dynamic>).first;
  }

  Future<List<dynamic>> getPostsData(int id) async {
    final response = await ApiService().getData(
      Endpoints.posts.buildURL(),
      queryParameters: {'userId': id},
    );
    // print('response: ${response.data}');
    return response.data;
  }

  Future<List<dynamic>> getAlbumsData(int id) async {
    final response = await ApiService().getData(
      Endpoints.albums.buildURL(),
      queryParameters: {'userId': id},
    );
    // print('response: ${response.data}');
    return response.data;
  }
}
