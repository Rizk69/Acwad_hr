import 'package:hr/data/network/app_api.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/data/responses/login/login_response.dart';
import 'package:hr/data/responses/register/register_response.dart';


abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);



}

class RemoteDataSourceImpl extends RemoteDataSource {
  final AppServiceClient _appServiceClient;

  RemoteDataSourceImpl(this._appServiceClient);

  @override
  Future<LoginResponse> login(LoginRequest loginRequest) {
    return _appServiceClient.login(loginRequest);
  }


}
