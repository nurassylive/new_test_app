// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

    final postSavedLocally = await _tryRetrievePostDataLocally();

    if (postSavedLocally != null && postSavedLocally.id == postId) {
      post.value = postSavedLocally;
    } else {
      final _postData = await PostDetailsRepo().getPostDataById(postId);
      post.value = Post.fromJson(_postData);
      _savePostDataLocally();
    }
  }

  void _getComments(int postId) async {
    final commentsSavedLocally = await _tryRetrieveCommentsDataLocally();
    if (commentsSavedLocally != null) {
      final _comments =
          commentsSavedLocally.map((json) => Comment.fromJson(json));
      for (Comment comment in _comments) {
        _commentsData.add(comment);
      }
    } else {
      final _repoData = await PostDetailsRepo().getCommentsData(postId);
      print('user comments data: $_repoData');
      final _comments = _repoData.map((json) => Comment.fromJson(json));
      for (Comment comment in _comments) {
        _commentsData.add(comment);
      }
      _saveCommentsDataLocally();
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

  Future<void> _savePostDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    if (post.value != null) {
      final userData = post.toJson();
      prefs.setString('postData', jsonEncode(userData));
    }
  }

  Future<void> _saveCommentsDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> jsonList =
        _commentsData.map((item) => jsonEncode(item)).toList();
    prefs.setStringList('commentsData', jsonList);
  }

  Future<Post?> _tryRetrievePostDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('postData')) {
      final prefsData = prefs.getString('userData');
      final postData = Post.fromJson(jsonDecode(prefsData!));
      return postData;
    }
    return null;
  }

  Future<List<dynamic>?> _tryRetrieveCommentsDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('commentsData')) {
      final prefsData = prefs.getStringList('commentsData');
      final List<dynamic> jsonList =
          prefsData!.map((item) => jsonDecode(item)).toList();
      return jsonList;
    }
    return null;
  }
}
