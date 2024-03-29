import 'package:flutter_clean_architecture/core/constants/constants_urls.dart';
import 'package:flutter_clean_architecture/core/error/exception.dart';
import 'package:flutter_clean_architecture/core/http_client/http_client.dart';
import 'package:flutter_clean_architecture/features/user/data/datasources/user/user_datasource.dart';
import 'package:flutter_clean_architecture/features/user/data/models/user/user_model.dart';

class UserDatasourceImp implements UsersDatasource {
  final HttpClient _httpClient;
  final ConstantsUrls apiConstants;

  UserDatasourceImp(this._httpClient, this.apiConstants);

  @override
  Future<List<UserModel>> getUsers() async {
    final response = await _httpClient.get(apiConstants.usersUrl);

    final data = response.data;

    final List<dynamic> jsonList = data;

    final List<UserModel> users =
        jsonList.map((data) => UserModel.fromJson(data)).toList();

    if (response.statusCode == 200) {
      return users;
    } else if (response.statusCode == 503) {
      throw const ServerException();
    } else {
      throw Exception();
    }
  }
}
