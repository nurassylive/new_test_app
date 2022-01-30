import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './text_container.dart';

import '../controllers/user_details_controller.dart';
import '../controllers/widget_controllers/posts_container_controller.dart';

class PostsContainer extends GetWidget<PostsContainerController> {
  const PostsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userDetailsController = Get.find<UserDetailsController>();

    return Obx(
      () => _userDetailsController.isLoading.isFalse
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount:
                  controller.posts.length < 3 ? controller.posts.length : 3,
              itemBuilder: (ctx, i) => TextContainer(
                title: controller.posts[i].title,
                subtitle: controller.posts[i].body,
                onTap: () => _userDetailsController
                    .gotoPostDetailsScreen(controller.posts[i].id),
              ),
            )
          : Container(),
    );
  }
}
