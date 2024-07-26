import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lazy_load/views/photo_list.dart';
import 'controllers/photo_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Photo List',
      initialBinding: BindingsBuilder(() {
        Get.put(PhotoController());
      }),
      home: const PhotoList(),
    );
  }
}
