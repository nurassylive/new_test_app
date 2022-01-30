import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/extensions.dart';

import '../controllers/post_details_controller.dart';

class PostView extends GetView<PostDetailsController> {
  const PostView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isFalse
          ? Column(
              children: [
                Text(
                  controller.post.value!.title.capitalizeString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.w),
                Text(controller.post.value!.body),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
