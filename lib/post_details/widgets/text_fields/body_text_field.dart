import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/add_comments_screen_controller.dart';

class BodyTextField extends StatelessWidget {
  const BodyTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addCommentsScreenController =
        Get.find<AddCommentsScreenController>();

    return TextFormField(
      minLines: 1,
      maxLines: 20,
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      controller: _addCommentsScreenController.bodyTextController,
      focusNode: _addCommentsScreenController.bodyTextNode,
      onFieldSubmitted: (_) =>
          _addCommentsScreenController.submitComments(context),
      showCursor: true,
      decoration: InputDecoration(
        hintText: 'Comment',
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
