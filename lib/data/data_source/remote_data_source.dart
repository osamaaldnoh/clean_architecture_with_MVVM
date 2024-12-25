import 'package:clean_architecture_with_mvvm/data/network/requests.dart';
import 'package:clean_architecture_with_mvvm/data/response/responses.dart';
import 'package:clean_architecture_with_mvvm/data/network/app_api.dart';

abstract class RemoteDataSource {
  Future<AuthenticationResponse> login(LoginRequest loginRequest);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  AppServiceClient _apiServiceClient;
  RemoteDataSourceImpl(this._apiServiceClient);
  @override
  Future<AuthenticationResponse> login(LoginRequest loginRequest) async {
    return await _apiServiceClient.login(
      loginRequest.email,
      loginRequest.password,
    );
  }
}
