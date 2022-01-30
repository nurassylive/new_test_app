import 'package:get/route_manager.dart';

import '../main/views/main_view.dart';
import '../main/bindings/main_bindings.dart';

import '../user_details/screens/user_details_screen.dart';
import '../user_details/bindings/user_details_bindings.dart';

import '../user_details/screens/posts_list_screen.dart';
import '../user_details/screens/albums_list_screen.dart';

import '../post_details/screens/post_details_screen.dart';
import '../post_details/bindings/post_details_bindings.dart';
import '../post_details/screens/add_comments_screen.dart';

import '../album_details/screens/album_details_screen.dart';
import '../album_details/bindings/album_details_bindings.dart';

class RouteGenerator {
  static final route = [
    GetPage(
      name: MainView.route,
      page: () => const MainView(),
      binding: MainBindings(),
    ),
    GetPage(
      name: UserDetailsScreen.route,
      page: () => const UserDetailsScreen(),
      binding: UserDetailsBindings(),
    ),
    GetPage(
      name: PostsListScreen.route,
      page: () => const PostsListScreen(),
      binding: UserDetailsBindings(),
    ),
    GetPage(
      name: AlbumsListScreen.route,
      page: () => const AlbumsListScreen(),
      binding: UserDetailsBindings(),
    ),
    GetPage(
      name: PostDetailsScreen.route,
      page: () => const PostDetailsScreen(),
      binding: PostDetailsBindings(),
    ),
    GetPage(
      name: AddCommentsScreen.route,
      page: () => const AddCommentsScreen(),
      binding: PostDetailsBindings(),
    ),
    GetPage(
      name: AlbumDetailsScreen.route,
      page: () => const AlbumDetailsScreen(),
      binding: AlbumDetailsBindings(),
    ),
  ];
}
