import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required DateTime? createdAt,
    required String? firstName,
    required String? lastName,
    required String? description,
    required String? image,
    required int? id,
  }) : super(
          createdAt: createdAt,
          firstName: firstName,
          lastName: lastName,
          description: description,
          image: image,
          id: id,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json['createdAt'] ?? DateTime.now(),
        firstName: json['firstName'] ?? '',
        lastName: json['lastName'] ?? '',
        description: json['description'] ?? '',
        image: json['image'] ?? '',
        id: json['id'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'firstName': firstName,
        'lastName': lastName,
        'description': description,
        'image': image,
        'id': id,
      };
}
