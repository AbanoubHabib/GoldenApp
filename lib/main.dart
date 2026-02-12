import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:goldenprice/core/api/dio_helper.dart';
import 'package:goldenprice/core/router/app_router.dart';
import 'package:goldenprice/core/router/app_routes.dart';

void main() async{
await DioHelper.init();
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: AppRoutes.homeScreen,
      onGenerateRoute: AppRouter().generaeRoute,
    );
  }
}
