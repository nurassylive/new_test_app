import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../shared/extensions.dart';

import '../controllers/album_details_controller.dart';

import '../widgets/album_photos_container.dart';

class AlbumPhotosView extends GetView<AlbumDetailsController> {
  const AlbumPhotosView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.isLoading.isFalse
          ? CarouselSlider.builder(
              itemCount: controller.albumPhotosData.length,
              itemBuilder: (
                BuildContext context,
                int itemIndex,
                int pageViewIndex,
              ) =>
                  AlbumPhotosContainer(
                      albumPhoto: controller.albumPhotosData[itemIndex]),
              options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                viewportFraction: 0.5,
                aspectRatio: 1.0,
              ),
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
