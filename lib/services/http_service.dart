import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/photo.dart';

class HttpService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/photos';

  Future<List<Photo>> fetchData(int page, int pageSize) async {
    final response =
        await http.get(Uri.parse('$baseUrl?_page=$page&_limit=$pageSize'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = json.decode(response.body);
      List<Photo> photos =
          jsonResponse.map((photo) => Photo.fromJson(photo)).toList();
      return photos;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
