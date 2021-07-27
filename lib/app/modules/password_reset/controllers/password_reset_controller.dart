import 'package:eventrack_app/app/models/response.dart';
import 'package:eventrack_app/app/modules/password_reset/provider/password_reset_provider.dart';
import 'package:eventrack_app/app/modules/password_reset/provider/password_reset_provider_impl.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  late TextEditingController newPassword;
  late TextEditingController retypedPassword;
  final RxBool obscureNewPassword = true.obs;
  final RxBool obscureRetyped = true.obs;
  final formKey = GlobalKey<FormState>();
  late PasswordResetProvider _provider;

  @override
  void onInit() {
    _provider = Get.find<PasswordResetProviderImpl>();
    newPassword = TextEditingController();
    retypedPassword = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    newPassword.dispose();
    retypedPassword.dispose();
  }

  String? passwordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (GetUtils.isLengthLessThan(value, 8))
      return 'The password must be at least 8 characters.';
    return null;
  }

  String? retypedPasswordValidator(String? value) {
    if (value!.isEmpty) return 'This field cannot be empty.';
    if (newPassword.text != value) return 'The passwords do not match.';
    return null;
  }

  void changePasswordObscurity() {
    obscureNewPassword.value = !obscureNewPassword.value;
  }

  void changeRetypedObscurity() {
    obscureRetyped.value = !obscureRetyped.value;
  }

  void submit() {
    if (formKey.currentState!.validate()) {
      // ResponseModel model =
    }
  }
}
