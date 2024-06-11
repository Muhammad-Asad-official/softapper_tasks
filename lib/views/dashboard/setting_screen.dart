
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.schedule,size: 100,color: Colors.orangeAccent,),
            Text("Comming soon",style: TextStyle(fontSize: 18),),
          ],
        ),
      ),
    );
  }
}
