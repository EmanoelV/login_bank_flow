import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:login_bank_flow/app/modules/extract/extract_page.dart';
import 'package:login_bank_flow/app/modules/login/login_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      getPages: [
        GetPage(name: "/login", page: () => LoginPage()),
        GetPage(name: "/extract", page: () => ExtractPage())
      ],
      initialRoute: '/login',
    );
  }
}
