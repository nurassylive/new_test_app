import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../user_details/screens/user_details_screen.dart';

class UserCard extends StatelessWidget {
  final int id;
  final String name;
  final String username;
  final Function onTap;

  const UserCard({
    Key? key,
    required this.id,
    required this.name,
    required this.username,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => Get.toNamed(
      //   UserDetailsScreen.route,
      //   arguments: {
      //     'userId': id,
      //     'username': username,
      //   },
      // ),
      onTap: () => onTap(),
      child: Card(
        elevation: 0.3,
        margin: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 8,
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 10,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 0.3.sw,
                    child: const Text('Name: '),
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  SizedBox(
                    width: 0.3.sw,
                    child: const Text('Username: '),
                  ),
                  Text(username),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
