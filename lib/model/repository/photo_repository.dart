import 'package:dio/dio.dart';
import 'package:flutter_agit/core/api_provider.dart';
import '../data/photo.dart';


class PhotoRepository extends ApiProvider {
  Future<List<Photo>> photos() async {
    try {
      
      Response response = await dio.get('photos?page=1');
      List<dynamic> listData = response.data;
      return listData.map((element) => Photo.fromJson(element)).toList();
    } on DioException catch (_) {
    
      return [];
    }
  }
}

