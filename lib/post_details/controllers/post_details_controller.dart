// ignore_for_file: avoid_print

import 'package:get/get.dart';

import '../../../models/post.dart';
import '../../../models/comment.dart';

import '../repositories/post_details_repo.dart';

import './widget_controllers/comments_view_controller.dart';

import '../screens/add_comments_screen.dart';

class PostDetailsController extends GetxController {
  final RxList<Comment> _commentsData = <Comment>[].obs;
  final Rx<Post?> post = Rx<Post?>(null);

  RxBool isLoading = false.obs;

  final _commentsViewController = Get.find<CommentsViewController>();

  void _getPostDataById(int postId) async {
    isLoading.value = true;
    final _postData = await PostDetailsRepo().getPostDataById(postId);
    print('postData: $_postData');
    post.value = Post.fromJson(_postData);
  }

  void _getComments(int postId) async {
    final _repoData = await PostDetailsRepo().getCommentsData(postId);
    print('user comments data: $_repoData');
    final _comments = _repoData.map((json) => Comment.fromJson(json));
    for (Comment comment in _comments) {
      _commentsData.add(comment);
    }
    _commentsViewController.setComments = _commentsData;

    isLoading.value = false;
  }

  void gotoAddCommentsScreen() => Get.toNamed(
        AddCommentsScreen.route,
        arguments: {'postId': Get.arguments['postId']},
      );

  @override
  void onInit() {
    final int id = Get.arguments['postId'];
    _getPostDataById(id);
    _getComments(id);
    super.onInit();
  }
}
