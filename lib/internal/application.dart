import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zippy/presentation/app_router.dart';
import 'package:zippy/presentation/app_theme.dart';
import 'package:zippy/presentation/bloc/auth/auth_cubit.dart';
import 'package:zippy/domain/repository/top_up/top_up_repository.dart';
import 'package:zippy/data/repository/top_up/top_up_data_repository.dart';
import 'package:zippy/data/api/api_util.dart';
import 'package:zippy/data/api/service/api_service.dart';

class ZippyApp extends StatelessWidget {
  const ZippyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<ApiService>(
            create: (context) => ApiService(), // You might need to pass some parameters here
          ),
          RepositoryProvider<ApiUtil>(
            create: (context) => ApiUtil(
              RepositoryProvider.of<ApiService>(context),
            ),
          ),
          RepositoryProvider<TopUpRepository>(
            create: (context) => TopUpDataRepository(
              RepositoryProvider.of<ApiUtil>(context),
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthCubit(FirebaseAuth.instance),
            ),
          ],
          child: MaterialApp.router(
            routerConfig: appRouter,
            title: 'Zippy',
            theme: appTheme,
          ),
        ),
      ),
    );
  }
}