import 'package:get/get.dart';
import 'package:lazy_load/models/photo.dart';
import 'package:lazy_load/services/http_service.dart';

class PhotoController extends GetxController {
  var photos = <Photo>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  int _page = 1;
  final int _pageSize = 7;
  final HttpService _httpService = HttpService();

  @override
  void onInit() {
    fetchPhotos();
    super.onInit();
  }

  Future<void> fetchPhotos() async {
    if (isLoading.value) return;

    isLoading.value = true;

    try {
      final newPhotos = await _httpService.fetchData(_page, _pageSize);
      if (newPhotos.isNotEmpty) {
        photos.addAll(newPhotos);
        _page++;
        hasMore.value = newPhotos.length == _pageSize;
      } else {
        hasMore.value = false;
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
