import 'package:get/get.dart';

import '../../../models/user.dart';

class UserListViewController extends GetxController {
  RxList<User> _users = RxList<User>();
  set setUsers(RxList<User> users) => _users = users;
  RxList<User> get users => _users;
}
