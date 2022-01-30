import 'package:get/get.dart';

import '../../../models/comment.dart';

class CommentsViewController extends GetxController {
  RxList<Comment> _comments = <Comment>[].obs;
  set setComments(RxList<Comment> comments) => _comments = comments;
  RxList<Comment> get comments => _comments;
}
