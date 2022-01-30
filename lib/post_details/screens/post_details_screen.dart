import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/comments_view.dart';
import '../views/post_view.dart';

import '../controllers/post_details_controller.dart';

class PostDetailsScreen extends StatelessWidget {
  static const route = '/postDetailsScreen';

  const PostDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postDetailsController = Get.find<PostDetailsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post #${Get.arguments['postId']}',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20.w,
            horizontal: 10.w,
          ),
          child: Column(
            children: [
              const PostView(),
              SizedBox(height: 20.w),
              Text(
                'Comments',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const CommentsView(),
              SizedBox(height: 10.w),
              TextButton(
                onPressed: () {
                  _postDetailsController.gotoAddCommentsScreen();
                },
                child: const Text('Add Comment'),
              ),
              SizedBox(height: 100.w),
            ],
          ),
        ),
      ),
    );
  }
}
