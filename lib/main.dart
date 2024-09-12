import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:flutter_bloc/flutter_bloc.dart'; // Не забудьте добавить этот импорт
import 'package:zippy/presentation/bloc/auth/auth_cubit.dart';
import 'presentation/app_router.dart';
import 'presentation/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const ZippyApp());
}

class ZippyApp extends StatelessWidget {
  const ZippyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [
        GestureType.onTap,
        GestureType.onPanUpdateDownDirection,
      ],
      child: BlocProvider(
        create: (context) => AuthCubit(FirebaseAuth.instance), // Оборачиваем в BlocProvider
        child: MaterialApp.router(
          routerConfig: appRouter,
          title: 'Zippy',
          theme: appTheme,
        ),
      ),
    );
  }
}