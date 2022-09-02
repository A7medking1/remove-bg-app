import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:removebackground/binding.dart';
import 'package:removebackground/views/pages/home_screen.dart';

import 'core/api_client/dio_helper.dart';

void main()  async
{
  WidgetsFlutterBinding.ensureInitialized();

  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      home: const HomeScreen(),
    );
  }
}

