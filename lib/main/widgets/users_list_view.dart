import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/main_controller.dart';
import '../controllers/widget_controllers.dart/user_list_view_controller.dart';
import '../widgets/user_card.dart';

class UsersListView extends GetWidget<UserListViewController> {
  const UsersListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _mainController = Get.find<MainController>();

    return Obx(
      () => _mainController.isLoading.isFalse
          ? ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 10.h),
              itemCount: controller.users.length,
              itemBuilder: (ctx, i) => UserCard(
                id: controller.users[i].id,
                name: controller.users[i].name,
                username: controller.users[i].username,
                onTap: () => _mainController.gotoDetailsScreen(
                  controller.users[i].id,
                  controller.users[i].username,
                ),
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
