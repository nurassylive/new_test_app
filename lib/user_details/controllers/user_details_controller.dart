// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/user.dart';
import '../../../models/post.dart';
import '../../../models/album.dart';

import '../repositories/user_details_repo.dart';

import './widget_controllers/posts_container_controller.dart';
import './widget_controllers/albums_container_controller.dart';

import '../screens/posts_list_screen.dart';
import '../screens/albums_list_screen.dart';

import '../../post_details/screens/post_details_screen.dart';
import '../../album_details/screens/album_details_screen.dart';

class UserDetailsController extends GetxController {
  final RxList<Post> _postsData = <Post>[].obs;
  final RxList<Album> _albumsData = <Album>[].obs;
  final Rx<User?> user = Rx<User?>(null);

  RxBool isLoading = false.obs;

  final _postsContainerController = Get.find<PostsContainerController>();
  final _albumsContainerController = Get.find<AlbumsContainerController>();

  void _getUserDataById(int id) async {
    isLoading.value = true;

    final userSavedLocally = await _tryRetrieveDataLocally();

    if (userSavedLocally != null && userSavedLocally.id == id) {
      user.value = userSavedLocally;
    } else {
      final _userData = await UserDetailsRepo().getDataById(id);
      user.value = User.fromJson(_userData);
      _saveUserDataLocally();
    }
  }

  void _getUserPosts(int id) async {
    final _repoData = await UserDetailsRepo().getPostsData(id);
    print('user posts data: $_repoData');
    final _posts = _repoData.map((json) => Post.fromJson(json));
    for (Post post in _posts) {
      _postsData.add(post);
    }
    _postsContainerController.setPosts = _postsData;
  }

  void _getUserAlbums(int id) async {
    final _repoData = await UserDetailsRepo().getAlbumsData(id);
    print('user albums data: $_repoData');
    final _albums = _repoData.map((json) => Album.fromJson(json));
    for (Album album in _albums) {
      _albumsData.add(album);
    }
    _albumsContainerController.setAlbums = _albumsData;

    isLoading.value = false;
  }

  void gotoPostsListScreen() => Get.toNamed(
        PostsListScreen.route,
        arguments: {
          'userId': Get.arguments['userId'],
          'username': Get.arguments['username'],
        },
      );

  void gotoAlbumsListScreen() => Get.toNamed(
        AlbumsListScreen.route,
        arguments: {
          'userId': Get.arguments['userId'],
          'username': Get.arguments['username'],
        },
      );

  void gotoPostDetailsScreen(int postId) => Get.toNamed(
        PostDetailsScreen.route,
        arguments: {
          'userId': Get.arguments['userId'],
          'postId': postId,
        },
      );

  void gotoAlbumDetailsScreen(int albumId, String albumTitle) => Get.toNamed(
        AlbumDetailsScreen.route,
        arguments: {
          'albumId': albumId,
          'albumTitle': albumTitle,
        },
      );

  @override
  void onInit() {
    final int id = Get.arguments['userId'];
    _getUserDataById(id);
    _getUserPosts(id);
    _getUserAlbums(id);
    super.onInit();
  }

  Future<void> _saveUserDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    if (user.value != null) {
      final userData = user.toJson();
      prefs.setString('userData', jsonEncode(userData));
    }
  }

  Future<User?> _tryRetrieveDataLocally() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('userData')) {
      final prefsData = prefs.getString('userData');
      final userData = User.fromJson(jsonDecode(prefsData!));
      return userData;
    }
    return null;
  }
}
