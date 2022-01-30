import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/extensions.dart';

import './comments_text_container.dart';

class CommentsContainer extends StatelessWidget {
  final String name;
  final String email;
  final String body;

  const CommentsContainer({
    Key? key,
    required this.name,
    required this.email,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(
        vertical: 12.w,
        horizontal: 10.w,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommentsTextContainer(
            title: 'Name: ',
            subtitle: name.capitalizeString(),
          ),
          CommentsTextContainer(
            title: 'E-Mail: ',
            subtitle: email.toLowerCase(),
          ),
          CommentsTextContainer(
            title: 'Comment: ',
            subtitle: body,
          ),
        ],
      ),
    );
  }
}
