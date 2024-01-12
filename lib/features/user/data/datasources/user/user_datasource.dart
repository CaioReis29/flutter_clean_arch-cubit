import 'package:flutter_clean_architecture/features/user/data/models/user/user_model.dart';

abstract class UsersDatasource {
  Future<List<UserModel>> getUsers();
}
