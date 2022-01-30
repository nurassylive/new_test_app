// ignore_for_file: avoid_print

import '../../shared/endpoints.dart';
import '../../services/api_service.dart';

class PostDetailsRepo {
  Future<Map<String, dynamic>> getPostDataById(int id) async {
    final response = await ApiService().getData(
      Endpoints.posts.buildURL(),
      queryParameters: {
        'id': id,
      },
    );
    // print('response: ${response.data}');
    return (response.data as List<dynamic>).first;
  }

  Future<List<dynamic>> getCommentsData(int postId) async {
    final response = await ApiService().getData(
      Endpoints.comments.buildURL(),
      queryParameters: {'postId': postId},
    );
    // print('response: ${response.data}');
    return response.data;
  }
}
