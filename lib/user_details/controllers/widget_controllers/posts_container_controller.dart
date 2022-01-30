import 'package:get/get.dart';

import '../../../models/post.dart';

class PostsContainerController extends GetxController {
  RxList<Post> _posts = RxList<Post>();
  set setPosts(RxList<Post> posts) => _posts = posts;
  RxList<Post> get posts => _posts;
}
