import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../views/album_photos_view.dart';

import '../../shared/extensions.dart' as ext;

class AlbumDetailsScreen extends StatelessWidget {
  static const route = '/albumDetailsScreen';

  const AlbumDetailsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${Get.arguments['albumTitle']}'.capitalizeString(),
        ),
      ),
      body: const Center(
        child: AlbumPhotosView(),
      ),
    );
  }
}
