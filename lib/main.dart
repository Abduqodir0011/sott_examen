import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sott_examen/core/dependencies.dart';
import 'package:sott_examen/core/routing/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: Size(390, 844));
    return MultiProvider(
      providers: providers,
      builder:
          (context, child) => MaterialApp.router(
            debugShowCheckedModeBanner: false,
            routerConfig: router,
          ),
    );
  }
}
