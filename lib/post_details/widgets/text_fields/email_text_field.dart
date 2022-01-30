import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/add_comments_screen_controller.dart';

class EmailTextField extends StatelessWidget {
  const EmailTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addCommentsScreenController =
        Get.find<AddCommentsScreenController>();

    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      controller: _addCommentsScreenController.emailTextController,
      focusNode: _addCommentsScreenController.emailTextNode,
      onFieldSubmitted: (_) =>
          _addCommentsScreenController.switchFocusToBodyTextNode(context),
      showCursor: true,
      decoration: InputDecoration(
        hintText: 'Email',
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        // filled: !_searchController.focusNode.hasFocus,
        // fillColor: Colors.grey[300],
        hintStyle: TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
