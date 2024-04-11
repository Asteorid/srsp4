import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:srsp4/generated/codegen_loader.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:srsp4/register_login/bloc/login_bloc.dart';
import 'package:srsp4/register_login/bloc/login_event.dart';
import 'package:srsp4/register_login/register_form_page.dart';
import 'package:srsp4/services/shared_pref.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: "AIzaSyAAoQcIXHvlZjZaeQkSWvDKoBiT_WveVCY",
          appId: "1:979021529271:android:1eb7c3381a1ff2ac17cd32",
          messagingSenderId: "979021529271",
          projectId: "instunder-ea325",
        ))
      : await Firebase.initializeApp();
  await sharedPreference.init();

  runApp(
    EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ru'), Locale('kk')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: const Locale('ru'),
        assetLoader: const CodegenLoader(),
        child: const MyApp()),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late LoginBloc loginBloc;

  @override
  void initState() {
    loginBloc = LoginBloc();
    loginBloc.add(LocaleInitLoginEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final savedLanguage = sharedPreference.getLanguage();
    Locale initialLocale =
        savedLanguage != null ? Locale(savedLanguage) : const Locale('en');

    return BlocProvider<LoginBloc>(
      create: (BuildContext context) => LoginBloc(),
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData.dark(),
              localizationsDelegates: context.localizationDelegates,
              supportedLocales: context.supportedLocales,
              locale:
                  initialLocale, // Установка начального языка из SharedPreferences
              home: const RegisterFormPage()
              //  BlocConsumer(
              //   bloc: loginBloc,
              //   builder: (context, state) {
              //     if (state is UnAuthLoginState) {
              //       return const RegisterFormPage();
              //     }
              //     if (state is AuthLoginState) return const BottomBarPage();
              //     return Container();
              //   },
              //   listener: (context, state) {
              //     if (state is LoadingLoginState) buildLoading();
              //   },
              // ),
              );
        },
      ),
    );
  }

  // Widget buildLoading() {
  //   return const Center(
  //     child: CircularProgressIndicator(
  //       color: Colors.white,
  //     ),
  //   );
  // }
}
