import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../models/album_photo.dart';

import '../../shared/extensions.dart';

class AlbumPhotosContainer extends StatelessWidget {
  final AlbumPhoto albumPhoto;

  const AlbumPhotosContainer({
    Key? key,
    required this.albumPhoto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          albumPhoto.url,
          fit: BoxFit.scaleDown,
          height: 0.5.sw,
          width: 0.5.sw,
          loadingBuilder: (context, child, loadingProgress) =>
              loadingProgress != null
                  ? SizedBox(
                      child: const Center(child: CircularProgressIndicator()),
                      height: 0.5.sw,
                      width: 0.5.sw,
                    )
                  : child,
        ),
        SizedBox(height: 10.h),
        Text(albumPhoto.title.capitalizeString()),
      ],
    );
  }
}
