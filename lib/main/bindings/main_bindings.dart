import 'package:get/get.dart';

import '../controllers/main_controller.dart';
import '../controllers/widget_controllers.dart/user_list_view_controller.dart';
import '../../user_details/controllers/user_details_controller.dart';

class MainBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserDetailsController());
    Get.lazyPut(() => UserListViewController());
    Get.put(MainController());
  }
}
