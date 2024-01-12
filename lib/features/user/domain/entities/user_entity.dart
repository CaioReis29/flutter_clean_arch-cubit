import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final DateTime? createdAt;
  final String? firstName;
  final String? lastName;
  final String? description;
  final String? image;
  final int? id;

  const UserEntity({
    required this.createdAt,
    required this.firstName,
    required this.lastName,
    required this.description,
    required this.image,
    required this.id,
  });

  @override
  List<Object?> get props => [];
}
