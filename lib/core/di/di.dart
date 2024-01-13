import 'package:flutter_clean_architecture/core/constants/constants_urls.dart';
import 'package:flutter_clean_architecture/core/http_client/http_client.dart';
import 'package:flutter_clean_architecture/core/http_client/http_client_imp.dart';
import 'package:flutter_clean_architecture/features/user/data/datasources/user/user_datasource.dart';
import 'package:flutter_clean_architecture/features/user/data/datasources/user/user_datasource_imp.dart';
import 'package:flutter_clean_architecture/features/user/data/repositories/user/user_repository_imp.dart';
import 'package:flutter_clean_architecture/features/user/domain/repositories/user_repository.dart';
import 'package:flutter_clean_architecture/features/user/domain/usecases/get_users_usecase.dart';
import 'package:flutter_clean_architecture/features/user/presentation/cubit/users_cubit.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

Future<void> setupServiceLocator() async {
  serviceLocator.registerFactory<ConstantsUrls>(
    () => ConstantsUrls(),
  );
  serviceLocator.registerFactory<HttpClient>(
    () => HttpClientImp(),
  );
  serviceLocator.registerFactory<UsersDatasource>(
    () => UserDatasourceImp(
      serviceLocator<HttpClient>(),
      serviceLocator<ConstantsUrls>(),
    ),
  );
  serviceLocator.registerFactory<UserRepository>(
    () => UserRepositoryImp(
      serviceLocator<UsersDatasource>(),
    ),
  );
  serviceLocator.registerFactory<GetUsersUsecase>(
    () => GetUsersUsecase(
      serviceLocator<UserRepository>(),
    ),
  );
  serviceLocator.registerFactory<UsersCubit>(
    () => UsersCubit(
      serviceLocator<GetUsersUsecase>(),
    ),
  );
}
