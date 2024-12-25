import 'package:clean_architecture_with_mvvm/data/mapper/mapper.dart';
import 'package:clean_architecture_with_mvvm/data/network/failure.dart';
import 'package:clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:clean_architecture_with_mvvm/domain/repository/repository.dart';
import 'package:dartz/dartz.dart';

import '../data_source/remote_data_source.dart';
import '../network/network_info.dart';

class RepositoryImpl implements Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;

  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      // its Connected to internet its,safe to call Api
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) {
        // Success
        // return Either Right
        // return Data
        return Right(response.toDomain());
      } else {
        // Failue --return bussiness error
        // return Either left
        return Left(
            Failure(409, response.message ?? "bussiness error message"));
      }
    } else {
      // return internet connection error
      return Left(Failure(501, "please check your internet connection"));
    }
  }
}
