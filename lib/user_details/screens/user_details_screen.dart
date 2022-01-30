import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/user_details_view.dart';

class UserDetailsScreen extends StatelessWidget {
  static const route = '/userDetailsScreen';

  const UserDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Get.arguments['username']}',
        ),
      ),
      body: const UserDetailsView(),
    );
  }
}
