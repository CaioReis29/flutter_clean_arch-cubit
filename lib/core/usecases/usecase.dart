import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_clean_architecture/core/error/failure.dart';

abstract class Usecase<Type, NoParams> {
  Future<Either<Failure, Type>> call(NoParams noParams);
}

abstract class UseCaseNoParams<Type> {
  Future<Either<Failure, Type>> call();
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
