import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'extract_controller.dart';

class ExtractPage extends StatelessWidget {
  final controller = Get.put(ExtractController(Get.arguments));

  ExtractPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(controller.loginData.codigo),
      ),
    );
  }
}
