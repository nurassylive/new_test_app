// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../models/album.dart';
import '../../../models/album_photo.dart';

import '../repositories/album_details_repo.dart';

class AlbumDetailsController extends GetxController {
  final Rx<Album?> album = Rx<Album?>(null);

  RxList<AlbumPhoto> _albumPhotosData = <AlbumPhoto>[].obs;
  set setAlbumPhotosData(RxList<AlbumPhoto> albumPhotosData) =>
      _albumPhotosData = albumPhotosData;
  RxList<AlbumPhoto> get albumPhotosData => _albumPhotosData;

  RxBool isLoading = false.obs;

  void _getPostDataById(int albumId) async {
    isLoading.value = true;
    final _albumData = await AlbumDetailsRepo().getAlbumDataById(albumId);
    print('albumData: $_albumData');
    album.value = Album.fromJson(_albumData);
  }

  void _getAlbumPhotos(int albumId) async {
    final _repoData = await AlbumDetailsRepo().getPhotosData(albumId);
    print('user album photos data: $_repoData');
    final _albumPhotos = _repoData.map((json) => AlbumPhoto.fromJson(json));
    for (AlbumPhoto photo in _albumPhotos) {
      _albumPhotosData.add(photo);
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    final int id = Get.arguments['albumId'];
    _getPostDataById(id);
    _getAlbumPhotos(id);
    super.onInit();
  }
}
