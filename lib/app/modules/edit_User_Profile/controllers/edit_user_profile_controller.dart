import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditUserProfileController extends GetxController {
  //TODO: Implement EditUserProfileController

  final count = 0.obs;
  
  @override
  void onInit() {
    super.onInit();
     
    final TextEditingController controller = TextEditingController(text: "Shreya Shrestha");
    print(controller);
  
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
