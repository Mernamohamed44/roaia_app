import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:roaia_app/localization/set_localization.dart';
import 'package:roaia_app/screen/splash.dart';

import 'core/helpers/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await CacheHelper.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

ValueNotifier<String> language = ValueNotifier('en');

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      splitScreenMode: true,
      builder: (context,child ){
       return ValueListenableBuilder(
         valueListenable: language,
         builder: (BuildContext context, String value, Widget? child) {
           return MaterialApp(
             locale: Locale(value),
             supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
             localizationsDelegates: const [
               SetLocalization.localizationsDelegate,
               GlobalMaterialLocalizations.delegate,
               GlobalWidgetsLocalizations.delegate,
               GlobalCupertinoLocalizations.delegate,
             ],
             debugShowCheckedModeBanner: false,
             title: 'roaia',
             theme: ThemeData(
               colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
               useMaterial3: true,
             ),
             home: const Splash_Screen(),
           );
         },
       );
      },

    );
  }
}
