import 'package:dio/dio.dart';

class ApiService {
  late Dio dio;

  ApiService() {
    dio = Dio(
      BaseOptions(
        headers: {
          "x-api-key": "free_user_3DL6is89aJcuDKgDAuyRx1c9hRq",
          "Content-Type": "application/json",
        },

        validateStatus: (status) {
          return status != null && status < 500;
        },
      ),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },

        onResponse: (response, handler) {
          return handler.next(response);
        },

        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );
  }
}