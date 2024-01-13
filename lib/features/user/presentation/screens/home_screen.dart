import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
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
        title: const Text('Test'),
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        bloc: cubit,
        builder: (context, state) {
          if (state is UsersLoading) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else if (state is UsersLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                log(state.users[index].firstName);
                return Text(
                  state.users[index].firstName,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                );
              },
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
