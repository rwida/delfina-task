import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import './app_logger.dart';

@Injectable()
class ApiService {
  ApiService(@Named('Dio') this._dio);

  static const String urlencodedType = 'application/x-www-form-urlencoded';
  static const String jsonType = 'application/json';
  static const String multiPart = "multipart/form-data";
  static const int unauthorizedCode = 401;
  static const int internalServerErrorCode = 500;
  static const String authorizationParameter = 'Authorization';
  static const String bearer = 'Bearer';
  final Dio _dio;

  /// Post api
  Future<Response<T>> postApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
    bool isJson = true,
    bool isAuth = true,
    bool isRefrsh = false,
  }) async {
    //call api
    if (isAuth) {
      await authorize(isRefrsh: isRefrsh);
    }

    final Response<T> response = await _dio.post(
      path,
      data: body,
      options: Options(
        headers: setHeaders(),
        contentType: isJson ? jsonType : urlencodedType,
        validateStatus: (int? status) {
          if (status == 403 || status == 401) return true;
          return status! <= 400;
        },
      ),
    );
    AppLogger.logApi("POST", path, body, response.data as Map<String, dynamic>);

    return response;
  }

  Future<Response<T>> getApi<T>(
    String path, {
    Map<String, dynamic> body = const <String, dynamic>{},
  }) async {
    // authorize the api
    await authorize();

    final Response<T> response = await _dio.get(
      path,
      queryParameters: body,
      options: Options(
          headers: setHeaders(),
          validateStatus: (int? status) {
            return status! < 400;
          }),
    );
    if (response.data is Map<String, dynamic>) AppLogger.logApi("GET", path, body, response.data as Map<String, dynamic>);

    return response;
  }

  Future<Response<T>> upload<T>(
    String path, {
    required Map<String, dynamic> body,
    bool isJson = true,
    bool isAuth = true,
    bool hasUserId = false,
  }) async {
    final FormData formData = FormData.fromMap(body);
    //call api
    if (isAuth) {
      authorize();
    }
    final Response<T> response = await _dio.post(
      path,
      data: formData,
      options: Options(
        headers: setHeaders(),
        validateStatus: (int? status) {
          return status! < 402;
        },
        // contentType: multiPart,
      ),
    );
    AppLogger.logApi("UPLOAD", path, {}, response.data! as Map<String, dynamic>);

    return response;
  }

  Future<void> authorize({bool isRefrsh = false}) async {
    const String token = '';
    _dio.options.headers[authorizationParameter] = '$bearer $token';
  }

  Future<Response<T>> putApi<T>(
    String path, {
    Map<String, dynamic> body = const {},
    bool isJson = true,
    bool isAuth = true,
    bool isRefrsh = false,
  }) async {
    //call api
    if (isAuth) {
      await authorize(isRefrsh: isRefrsh);
    }

    final Response<T> response = await _dio.put(path,
        data: body,
        options: Options(
            headers: setHeaders(),
            contentType: isJson ? jsonType : urlencodedType,
            validateStatus: (int? status) {
              // if (status == 401) return false;
              return true;
            }));
    AppLogger.logApi("PUT", path, body, response.data as Map<String, dynamic>);

    return response;
  }

  Map<String, dynamic>? setHeaders() {
    Map<String, dynamic>? headers = {};
    return headers;
  }
}
