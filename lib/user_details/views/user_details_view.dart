import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/user_details_controller.dart';

import '../widgets/text_container.dart';
import '../widgets/company_container.dart';
import '../widgets/address_container.dart';
import '../widgets/posts_container.dart';
import '../widgets/albums_container.dart';

class UserDetailsView extends GetView<UserDetailsController> {
  static const route = '/userDetailsView';

  const UserDetailsView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isFalse && controller.user.value != null
          ? SingleChildScrollView(
              child: Column(
                children: [
                  TextContainer(
                    title: 'Name',
                    subtitle: controller.user.value!.name,
                  ),
                  TextContainer(
                    title: 'E-mail',
                    subtitle: controller.user.value!.email,
                  ),
                  TextContainer(
                    title: 'Phone',
                    subtitle: controller.user.value!.phone,
                  ),
                  TextContainer(
                    title: 'Website',
                    subtitle: controller.user.value!.website,
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    'Company',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  CompanyContainer(
                    name: controller.user.value!.company['name'],
                    bs: controller.user.value!.company['bs'],
                    phrase: controller.user.value!.company['catchPhrase'],
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  AddressContainer(
                    address: controller.user.value!.address,
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    'Posts',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const PostsContainer(),
                  TextButton(
                    onPressed: () => controller.gotoPostsListScreen(),
                    child: const Text('More Posts'),
                  ),
                  SizedBox(height: 20.w),
                  Text(
                    'Albums',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const AlbumsContainer(),
                  TextButton(
                    onPressed: () => controller.gotoAlbumsListScreen(),
                    child: const Text('More Albums'),
                  ),
                  SizedBox(height: 100.h),
                ],
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
