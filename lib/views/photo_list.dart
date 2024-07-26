import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/photo_controller.dart';
import '../widgets/photo_card.dart';

class PhotoList extends StatelessWidget {
  const PhotoList({super.key});

  @override
  Widget build(BuildContext context) {
    final PhotoController controller = Get.find();
    final ScrollController scrollController = ScrollController();

    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        if (!controller.isLoading.value && controller.hasMore.value) {
          controller.fetchPhotos();
        }
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text("Photos List"),
      ),
      body: Obx(() {
        if (controller.photos.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            controller: scrollController,
            itemCount:
                controller.photos.length + (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index >= controller.photos.length) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return PhotoCard(photo: controller.photos[index]);
              }
            },
          );
        }
      }),
    );
  }
}
