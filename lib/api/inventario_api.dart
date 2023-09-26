import 'package:dio/dio.dart';
import 'package:gestion_inventario/services/local_storage.dart';

class InventarioApi {
  static final Dio _dio = Dio();

  static void configureDio() {
    //Base de url
    _dio.options.baseUrl = 'http://127.0.0.1:8000/api/v1';
    final aut = LocalStorage.prefs.getString('token') ?? '';
    // Configurar Headers
    _dio.options.headers = {
      'accept': 'application/json',
      'Authorization': 'Bearer $aut'
    };
  }

  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } on DioException catch (e) {
      String err = 'Error en el Get';
      if (e.response != null) {
        err = e.response!.data['detail'];
      }
      throw (err);
    }
  }

  static Future post(String path, Map<String, dynamic> data) async {
    _dio.options.headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    final formData = FormData.fromMap(data);
    try {
      final response = await _dio.post(path, data: formData);
      return response.data;
    } on DioException catch (err) {
      print(err);
      throw (err.response!.data['detail']);
    }
  }

  static Future postJson(String path, Map<String, dynamic> data) async {
    _dio.options.headers = {'Content-Type': 'application/json'};

    try {
      final res = await _dio.post(path, data: data);
      return res.data;
    } on DioException catch (e) {
      String err = '';
      if (e.response != null) {
        err = e.response!.data['detail'];
      }
      throw (err);
    }
  }

  static Future put(String path, Map<String, dynamic> data) async {
    try {
      final resp = await _dio.put(path, data: data);
      return resp.data;
    } on DioException catch (e) {
      print(e);
      throw ('Error en el PUT');
    }
  }

  static Future delete(String path, Map<String, dynamic> data) async {
    final formData = FormData.fromMap(data);

    try {
      final resp = await _dio.delete(path, data: formData);
      return resp.data;
    } on DioException catch (e) {
      print(e);
      throw ('Error en el delete');
    }
  }
}
