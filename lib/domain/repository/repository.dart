import 'package:clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:clean_architecture_with_mvvm/domain/model/models.dart';
import 'package:dartz/dartz.dart';
import '../../data/network/failure.dart';

abstract class Repository {
  Future<Either<Failure, Authentication>> login(LoginRequest loginRequest);
}
