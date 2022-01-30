import 'package:get/get.dart';

import '../../../models/album.dart';

class AlbumsContainerController extends GetxController {
  RxList<Album> _albums = RxList<Album>();
  set setAlbums(RxList<Album> albums) => _albums = albums;
  RxList<Album> get albums => _albums;
}
