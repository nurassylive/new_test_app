import 'package:get/get.dart';

import '../controllers/album_details_controller.dart';

class AlbumDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AlbumDetailsController());
  }
}
