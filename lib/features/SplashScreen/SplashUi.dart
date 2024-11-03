// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:noteapp/features/StartPage/StartPageUI.dart';
import '../../core/Shared/AssetsForApp.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage(ColorManagement.splashPhoto)),
      ),
    );
  }
}
