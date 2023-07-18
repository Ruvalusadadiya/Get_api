import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_calling/screen/home_screen/home_screen_controller.dart';
import 'package:get_api_calling/screen/home_screen/home_screen_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      body: productList(),
      appBar: homeAppbar,
    );
  }
}
