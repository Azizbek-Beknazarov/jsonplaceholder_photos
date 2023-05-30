import 'package:dio/dio.dart';
import 'package:jsonplaceholder_photos/model/photos_model.dart';

class DioClient {
  DioClient._();

  final Dio dio = Dio();

  static final DioClient instance = DioClient._();

  Future<List<PhotosModel>> fetchPhotos() async {
    try {
      final response =
          await dio.get('https://jsonplaceholder.typicode.com/photos');
      print("----> response.statusCode: ${response.statusCode.toString()}");
      if (response.statusCode == 200) {
        //bu yerda data -Response body dynamic tipda kelyapti. Response<dynamic> ni List<dynamic> ga o'tkazdik.
        final result = response.data as List;

        //List<dynamic> ni List<PhotosModel> ga o'tkazdik.

        ///1 usul
        // final list = result.map((json) => PhotosModel.fromJson(json)).toList();

        ///2 usul
        final list = List.generate(
            result.length, (index) => PhotosModel.fromJson(result[index]));

        ///3 usul
        // var list = List<PhotosModel>.from(
        //     response.data.map((model) => PhotosModel.fromJson(model)));

        return list;
      } else {
        throw Exception('Can\'t get photos');
      }
    } finally {
      dio.close();
    }
  }
}
