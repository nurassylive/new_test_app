import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/extensions.dart';

class TextContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Function? onTap;

  const TextContainer({
    Key? key,
    required this.title,
    this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        vertical: 2.w,
        horizontal: 10.w,
      ),
      child: InkWell(
        onTap: () => onTap != null ? onTap!() : null,
        child: Card(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 12.w,
              horizontal: 10.w,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.capitalizeString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) SizedBox(height: 5.w),
                if (subtitle != null)
                  Row(
                    children: [
                      SizedBox(width: 40.w),
                      Expanded(
                          child: Text(
                        subtitle!.capitalizeString(),
                        maxLines: 1,
                      )),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
