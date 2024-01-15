import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/extensions/string_to_datetime_extension.dart';
import 'package:flutter_clean_architecture/features/user/domain/entities/user_entity.dart';

class ListViewUsers extends StatelessWidget {
  const ListViewUsers({
    super.key,
    required this.users,
  });

  final List<UserEntity> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  users[index].image,
                ),
              ),
              title: Text(
                ' ${users[index].firstName} ${users[index].lastName}',
              ),
              titleTextStyle: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              subtitle: Text(
                users[index].createdAt.formatedToBrazilianTime(),
              ),
              subtitleTextStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              contentPadding: const EdgeInsets.all(5),
              horizontalTitleGap: 8,
            ),
            Text(
              users[index].description,
              textAlign: TextAlign.left,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
