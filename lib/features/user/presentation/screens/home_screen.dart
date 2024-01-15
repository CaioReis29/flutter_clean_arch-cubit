import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';
import 'package:flutter_clean_architecture/features/user/presentation/cubit/users_cubit.dart';
import 'package:flutter_clean_architecture/features/user/presentation/widgets/list_view_users.dart';

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
              child: ListViewUsers(users: state.users),
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
