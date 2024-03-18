import 'package:dio/dio.dart';
import 'package:aw_customer/data/model/api/request/LoginRequest.dart';

abstract class BaseApiService {
  static final String BASE_URL = "https://ww-user-api.developteam.net/";
  static final String GEO_SEARCH_URL = "https://maps.googleapis.com/maps/api";
  static final String MEDIA_URL = "https://org-media-template.developteam.net";

  Future<dynamic> get(String url, Options options);
  Future<dynamic> post(String url, Map<String, dynamic> data, Options options);
  Future<dynamic> put(String url, Map<String, dynamic> data, Options options);
}
