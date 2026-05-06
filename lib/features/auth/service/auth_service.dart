import 'package:dio/dio.dart';
import '../../../core/constants/api_urls.dart';
import '../../../core/services/api_service.dart';
import '../model/login_response_model.dart';

class AuthService {
  final ApiService apiService = ApiService();

  Future<LoginResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await apiService.dio.post(
        ApiUrls.login,

        data: {"email": email, "password": password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return LoginResponseModel.fromJson(response.data);
      } else {
        throw Exception(response.data["error"] ?? "Login Failed");
      }
    } on DioException catch (e) {
      throw Exception(
        e.response?.data["error"] ?? e.message ?? "Network Error",
      );
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
