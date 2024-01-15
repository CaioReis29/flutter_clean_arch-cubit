import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/core/extensions/string_to_datetime_extension.dart';
import 'package:flutter_clean_architecture/features/user/presentation/cubit/users_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UsersCubit cubit = serviceLocator<UsersCubit>();

  @override
  void initState() {
    cubit.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        centerTitle: true,
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UsersLoaded) {
            return RefreshIndicator.adaptive(
              onRefresh: cubit.getUsers,
              child: ListView.builder(
                itemCount: state.users.length,
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
                            state.users[index].image,
                          ),
                        ),
                        title: Text(
                          ' ${state.users[index].firstName} ${state.users[index].lastName}',
                        ),
                        titleTextStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                        subtitle: Text(
                          state.users[index].createdAt
                              .formatedToBrazilianTime(),
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
                        state.users[index].description,
                        textAlign: TextAlign.left,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else if (state is UsersError) {
            return Center(
              child: Text((state).message),
            );
          } else {
            return const Center(
              child: Text("Error"),
            );
          }
        },
      ),
    );
  }
}
