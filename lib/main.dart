import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_router.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(MyApp(
    appRouter: AppRouter(),
    prefs: prefs,
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final SharedPreferences? prefs;
  const MyApp({super.key, required this.appRouter, this.prefs});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: appRouter.generateRoute,
    );
  }
}
