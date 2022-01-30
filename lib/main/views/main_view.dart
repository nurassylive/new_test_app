import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/users_list_view.dart';

class MainView extends GetView {
  static const route = '/';

  const MainView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test App'),
      ),
      body: const UsersListView(),
    );
  }
}
