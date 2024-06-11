import 'package:flutter/material.dart';
import 'package:softapper_tasks/utility/auth_util.dart';
import 'package:softapper_tasks/views/components/my_button.dart';
import 'package:softapper_tasks/views/splash/splash_screen.dart';

import '../../models/user_model.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  const ProfileScreen({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person,size: 50,),
            ),
            const SizedBox(height: 20),
             myRow("Name", user.name),
             myRow("Email", user.email),
             myRow("Contact", user.phoneNumber),
             myRow("Emergency Contact", user.emergencyContact),
             myRow("CNIC", user.cnicNumber),
             myRow("Address", user.address),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: MyButton(title: "SIGN OUT", onPress: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text("Sign Out"),
                    content: Text("Are you sure to Sign out"),
                    actions: [
                      MyButton(title: "No",width: 80,height: 40, onPress: () {
                        Navigator.pop(context);
                      },),
                      MyButton(title: "Yes",width:80,height:40,color: Colors.red, onPress: () {
                        
                        AuthUtility().signOut().then((value) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => SplashScreen(),), (route) => true);
                        });
                      },)
                    ],
                  );
                },);

              },color: Colors.red),
            )
          ],
        ),
      ),
    );
  }
}

Padding myRow(String key, String value){
  return Padding(
    padding:  EdgeInsets.symmetric(vertical: 10,horizontal: 20),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(key,style: TextStyle(fontSize: 18),),
            Text(value,style: TextStyle(fontSize: 18),),
          ],
        ),
        Divider()
      ],
    ),
  );
}