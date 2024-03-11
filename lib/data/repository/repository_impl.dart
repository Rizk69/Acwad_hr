import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hr/app/constants.dart';
import 'package:hr/data/data_source/remote_data_source.dart';
import 'package:hr/data/mapper/login/login_mapper.dart';
import 'package:hr/data/network/error_handler.dart';
import 'package:hr/data/network/failure.dart';
import 'package:hr/data/network/network_info.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/domain/model/login/login_model.dart';
import 'package:hr/domain/repository/repository.dart';
import 'package:hr/generated/locale_keys.g.dart';


class RepositoryImpl extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, LoginModel>> login(LoginRequest loginRequest) async {
    try {
      // its connected to internet, its safe to call API
      final response = await _remoteDataSource.login(loginRequest);
      if (response.returnValue == 0) {
        // success return data
        return Right(response.toDomain());
      } else {
        // failure --return business error
        return Left(
          Failure(
            ResponseCode.UNAUTHORIZED,
            response.returnString ?? LocaleKeys.UNAUTHORIZED.tr(),
          ),
        );
      }
    } catch (error) {
      return Left(ErrorHandler.handle(error).failure);
    }
  }



}
