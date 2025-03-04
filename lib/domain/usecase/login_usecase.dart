import 'package:dartz/dartz.dart';
import 'package:hr/data/network/failure.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/domain/model/login/login_model.dart';
import 'package:hr/domain/repository/repository.dart';
import 'package:hr/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginRequest, LoginModel> {
  final Repository _repository;

  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, LoginModel>> execute(LoginRequest loginRequest) async {
    return await _repository.login(loginRequest);
  }
}
