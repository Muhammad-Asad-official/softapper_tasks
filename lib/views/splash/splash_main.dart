import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softapper_tasks/utility/auth_util.dart';
import 'package:softapper_tasks/views/dashboard/dashboard_screen.dart';
import 'package:softapper_tasks/views/splash/splash_screen.dart';

import '../../models/user_model.dart';


class SplashScreenMain extends StatefulWidget {
  const SplashScreenMain({super.key});

  @override
  State<SplashScreenMain> createState() => _SplashScreenMainState();
}

class _SplashScreenMainState extends State<SplashScreenMain> {
  void navigateToHomeScreen(Map<String, dynamic> user) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  DashboardScreen(user: User.fromJson(user),),
        ));
  }

  void navigateRegisterScreen() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        ));
  }
  Future<void> check() async {
    AuthUtility().check().then((value) {

      Future.delayed(
        const Duration(seconds: 1),
            () {
          if (value.isNotEmpty) {
            navigateToHomeScreen(value);
          } else {
            navigateRegisterScreen();
          }
        },
      );
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
check();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(Icons.house,size: 100,color: Colors.orange,),
      ),
    );
  }
}
