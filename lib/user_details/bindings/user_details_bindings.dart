import 'package:get/get.dart';

import '../controllers/user_details_controller.dart';
import '../controllers/widget_controllers/posts_container_controller.dart';
import '../controllers/widget_controllers/albums_container_controller.dart';

class UserDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PostsContainerController());
    Get.lazyPut(() => AlbumsContainerController());
    Get.put(UserDetailsController());
  }
}
