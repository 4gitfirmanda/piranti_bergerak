import 'package:flutter/material.dart';
import 'package:flutter_agit/controller/auth_controller.dart';
import 'package:flutter_agit/controller/feed_controller.dart';
import 'package:flutter_agit/controller/home_controller.dart';
import 'package:flutter_agit/controller/photo_controller.dart';
import 'package:flutter_agit/view/home_page.dart';
import 'package:provider/provider.dart';
import 'core/hive_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  void initState() {
    HiveStorage.instance.initBox();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhotoController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Our App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
