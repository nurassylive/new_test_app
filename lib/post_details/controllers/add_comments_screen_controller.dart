// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as dio;

class AddCommentsScreenController extends GetxController {
  RxBool isLoading = true.obs;

  late TextEditingController nameTextController;
  late FocusNode nameTextNode;

  late TextEditingController emailTextController;
  late FocusNode emailTextNode;

  late TextEditingController bodyTextController;
  late FocusNode bodyTextNode;

  void clearTextFields() {
    nameTextController.clear();
    nameTextNode.unfocus();
    emailTextController.clear();
    emailTextNode.unfocus();
    bodyTextController.clear();
    bodyTextNode.unfocus();
  }

  void switchFocusToEmailTextNode(BuildContext context) {
    if (nameTextController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write your name')));
      FocusScope.of(context).requestFocus(nameTextNode);
      return;
    }
    FocusScope.of(context).requestFocus(emailTextNode);
  }

  void switchFocusToBodyTextNode(BuildContext context) {
    if (emailTextController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write your email')));
      FocusScope.of(context).requestFocus(emailTextNode);
      return;
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailTextController.value.text)) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write correct email address')));
      FocusScope.of(context).requestFocus(emailTextNode);
      return;
    }
    FocusScope.of(context).requestFocus(bodyTextNode);
  }

  Future<void> submitComments(BuildContext context) async {
    if (nameTextController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write your name')));
      return;
    } else if (emailTextController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write your email')));
      return;
    } else if (bodyTextController.value.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please write your comment')));
      return;
    }
    hideKeyboard();
    await _postComments(context).then((_) {
      clearTextFields();
      Get.back();
      showAlertDialogWhenSubmitted(context);
    });
  }

  void showAlertDialogWhenSubmitted(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: const Text('Success!'),
            content: const Text('Comments created...'),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text('OK'),
              ),
            ],
          );
        });
  }

  void hideKeyboard() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    nameTextNode.unfocus();
    emailTextNode.unfocus();
    bodyTextNode.unfocus();
  }

  Future<void> _postComments(BuildContext context) async {
    try {
      dio.FormData.fromMap({
        'postId': Get.arguments['postId'],
        'name': nameTextController.value.text,
        'email': emailTextController.value.text,
        'body': bodyTextController.value.text,
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Something went wrong. Error: $e Try again later...'),
        ),
      );
      rethrow;
    }
  }

  @override
  void onInit() {
    nameTextController = TextEditingController();
    nameTextNode = FocusNode();
    emailTextController = TextEditingController();
    emailTextNode = FocusNode();
    bodyTextController = TextEditingController();
    bodyTextNode = FocusNode();

    nameTextNode.requestFocus();

    super.onInit();
  }

  @override
  void dispose() {
    nameTextController.dispose();
    nameTextNode.dispose();
    emailTextController.dispose();
    emailTextNode.dispose();
    bodyTextController.dispose();
    bodyTextNode.dispose();
    super.dispose();
  }
}
