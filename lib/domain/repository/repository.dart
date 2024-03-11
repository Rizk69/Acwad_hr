import 'package:dartz/dartz.dart';
import 'package:hr/data/network/failure.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/domain/model/login/login_model.dart';

abstract class Repository {
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest);

}
