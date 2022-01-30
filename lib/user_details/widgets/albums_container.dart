import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './text_container.dart';

import '../controllers/user_details_controller.dart';
import '../controllers/widget_controllers/albums_container_controller.dart';

class AlbumsContainer extends GetWidget<AlbumsContainerController> {
  const AlbumsContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _userDetailsController = Get.find<UserDetailsController>();

    return Obx(() => _userDetailsController.isLoading.isFalse
        ? ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount:
                controller.albums.length < 3 ? controller.albums.length : 3,
            itemBuilder: (ctx, i) => TextContainer(
              title: controller.albums[i].title,
              onTap: () => _userDetailsController.gotoAlbumDetailsScreen(
                controller.albums[i].id,
                controller.albums[i].title,
              ),
            ),
          )
        : Container());
  }
}
