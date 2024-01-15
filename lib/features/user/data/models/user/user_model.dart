import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required String createdAt,
    required String firstName,
    required String lastName,
    required String description,
    required String image,
    required String id,
  }) : super(
          createdAt: createdAt,
          firstName: firstName,
          lastName: lastName,
          description: description,
          image: image,
          id: id,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        createdAt: json['createdAt'] ?? '',
        firstName: json['first_name'] ?? '',
        lastName: json['last_name'] ?? '',
        description: json['description'] ?? '',
        image: json['image'] ?? '',
        id: json['id'] ?? '',
      );

  Map<String, dynamic> toJson() => {
        'createdAt': createdAt,
        'first_name': firstName,
        'last_name': lastName,
        'description': description,
        'image': image,
        'id': id,
      };

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      createdAt: userEntity.createdAt,
      firstName: userEntity.firstName,
      lastName: userEntity.lastName,
      description: userEntity.description,
      image: userEntity.image,
      id: userEntity.id,
    );
  }
}
