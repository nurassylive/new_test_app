// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controllers/add_comments_screen_controller.dart';

import '../widgets/text_fields/body_text_field.dart';
import '../widgets/text_fields/email_text_field.dart';
import '../widgets/text_fields/name_text_field.dart';

class AddCommentsScreen extends StatelessWidget {
  static const route = '/addCommentsScreen';

  const AddCommentsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _addCommentsScreenController =
        Get.find<AddCommentsScreenController>();

    return GestureDetector(
      onTap: () => _addCommentsScreenController.hideKeyboard(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Comments'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.w,
              horizontal: 10.w,
            ),
            child: Column(
              children: [
                const NameTextField(),
                const EmailTextField(),
                const BodyTextField(),
                TextButton(
                  onPressed: () {
                    _addCommentsScreenController.submitComments(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
