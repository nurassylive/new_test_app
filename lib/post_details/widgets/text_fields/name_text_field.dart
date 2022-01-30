import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/add_comments_screen_controller.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addCommentsScreenController =
        Get.find<AddCommentsScreenController>();

    return TextFormField(
      maxLines: 1,
      keyboardType: TextInputType.name,
      autofocus: true,
      textInputAction: TextInputAction.next,
      controller: _addCommentsScreenController.nameTextController,
      focusNode: _addCommentsScreenController.nameTextNode,
      onFieldSubmitted: (_) =>
          _addCommentsScreenController.switchFocusToEmailTextNode(context),
      showCursor: true,
      decoration: InputDecoration(
        hintText: 'Name',
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
