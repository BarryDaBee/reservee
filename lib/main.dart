import 'package:flutter/material.dart';

import 'core/exports.dart';

void main() {
  runApp(const Reservee());
}

class Reservee extends StatelessWidget {
  const Reservee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
        ),
        onGenerateRoute: onGenerateRoute,
        initialRoute: splashView,
      ),
    );
  }
}
