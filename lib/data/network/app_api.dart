import 'package:dio/dio.dart';
import 'package:hr/app/constants.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/data/responses/login/login_response.dart';
import 'package:hr/data/responses/register/register_response.dart';
import 'package:retrofit/http.dart';

part 'app_api.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;

  @POST("api/user/login")
  Future<LoginResponse> login(@Body() LoginRequest loginRequest);
}
