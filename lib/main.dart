import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/bloc_observer.dart';
import 'package:flutter_clean_architecture/core/app/my_app.dart';
import 'package:flutter_clean_architecture/core/di/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SimpleBlocObserver();

  await setupServiceLocator();

  runApp(const MyApp());
}
