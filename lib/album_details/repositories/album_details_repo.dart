// ignore_for_file: avoid_print

import '../../shared/endpoints.dart';
import '../../services/api_service.dart';

class AlbumDetailsRepo {
  Future<Map<String, dynamic>> getAlbumDataById(int id) async {
    final response = await ApiService().getData(
      Endpoints.albums.buildURL(),
      queryParameters: {
        'id': id,
      },
    );
    // print('response: ${response.data}');
    return (response.data as List<dynamic>).first;
  }

  Future<List<dynamic>> getPhotosData(int albumId) async {
    final response = await ApiService().getData(
      Endpoints.photos.buildURL(),
      queryParameters: {'albumId': albumId},
    );
    // print('response: ${response.data}');
    return response.data;
  }
}
