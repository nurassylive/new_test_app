import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/post_details_controller.dart';
import '../controllers/widget_controllers/comments_view_controller.dart';

import '../widgets/comments_container.dart';

class CommentsView extends GetWidget<CommentsViewController> {
  const CommentsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postDetailsController = Get.find<PostDetailsController>();

    return Obx(
      () => _postDetailsController.isLoading.isFalse
          ? ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.comments.length,
              itemBuilder: (ctx, i) => CommentsContainer(
                name: controller.comments[i].name,
                email: controller.comments[i].email,
                body: controller.comments[i].body,
              ),
            )
          : Container(),
    );
  }
}
