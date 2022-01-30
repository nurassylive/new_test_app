import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/widget_controllers/posts_container_controller.dart';
import '../controllers/user_details_controller.dart';

import '../widgets/text_container.dart';

class PostsListScreen extends StatelessWidget {
  static const route = '/postsListScreen';

  const PostsListScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _postsContainerController = Get.find<PostsContainerController>();
    final _userDetailsController = Get.find<UserDetailsController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Get.arguments['username']} posts',
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: _postsContainerController.posts.length,
        itemBuilder: (ctx, i) => TextContainer(
          title: _postsContainerController.posts[i].title,
          subtitle: _postsContainerController.posts[i].body,
          onTap: () => _userDetailsController
              .gotoPostDetailsScreen(_postsContainerController.posts[i].id),
        ),
      ),
    );
  }
}
