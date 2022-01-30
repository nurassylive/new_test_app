import 'package:get/get.dart';

import '../../shared/endpoints.dart';
import '../repositories/main_repo.dart';
import '../../models/user.dart';

import '../controllers/widget_controllers.dart/user_list_view_controller.dart';

import '../../user_details/screens/user_details_screen.dart';

// ignore_for_file: avoid_print
class MainController extends GetxController {
  final RxList<User> _usersList = <User>[].obs;
  RxBool isLoading = false.obs;

  final MainRepo _mainRepo = MainRepo();

  final _userListViewController = Get.find<UserListViewController>();

  Future<void> getUsersData() async {
    isLoading.value = true;

    List<dynamic> _repoData = await _mainRepo.getData(Endpoints.users);

    print('_repoData: $_repoData');
    // print('_repoData length: ${_repoData.length}');

    final _users = _repoData.map((json) => User.fromJson(json));

    for (User user in _users) {
      _usersList.add(user);
    }

    // print('_usersList: $_usersList');
    // print('_usersList length: ${_usersList.length}');

    _userListViewController.setUsers = _usersList;
    isLoading.value = false;
  }

  void gotoDetailsScreen(
    int userId,
    String username,
  ) {
    Get.toNamed(
      UserDetailsScreen.route,
      arguments: {
        'userId': userId,
        'username': username,
      },
    );
  }

  @override
  void onInit() {
    getUsersData();
    super.onInit();
  }
}
