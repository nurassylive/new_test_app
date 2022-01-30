import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';
import '../controllers/widget_controllers/comments_view_controller.dart';
import '../controllers/add_comments_screen_controller.dart';

class PostDetailsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddCommentsScreenController());
    Get.lazyPut(() => CommentsViewController());
    Get.put(PostDetailsController());
  }
}
