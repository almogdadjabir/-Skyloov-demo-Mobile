import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:skyloov/screens/welcome/presentation/pages/splashScreen.dart';
import 'package:skyloov/utility/dependencies_provider.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  DependenciesProvider.build();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Skyloov Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}