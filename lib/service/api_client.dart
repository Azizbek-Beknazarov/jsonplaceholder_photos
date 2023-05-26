import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jsonplaceholder_photos/model/photos_model.dart';

class ApiClient {
  ApiClient._();

  static final ApiClient instance = ApiClient._();

  Future<List<PhotosModel>> fetchPhotos() async {
    var client = http.Client();
    try {
      final response = await client
          .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));
      if (response.statusCode == 200) {
        var list = json.decode(response.body) as List<dynamic>;
        List<PhotosModel> photos =
            list.map((model) => PhotosModel.fromJson(model)).toList();
        return Future.value(photos);
      } else {
        throw Exception('Can\'t get photos');
      }
    } finally {
      client.close();
    }
  }
}
