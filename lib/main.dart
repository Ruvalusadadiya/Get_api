import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_api_calling/screen/home_screen/home_screen.dart';

main() {
  runApp(const RunApp());
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
