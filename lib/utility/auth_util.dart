


import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:softapper_tasks/utility/snackbar_util.dart';

import '../models/user_model.dart';
import '../views/dashboard/dashboard_screen.dart';
import 'log_util.dart';

class AuthUtility{
  final String userKey =  "isLogin";
  Future<bool> registerUser(String email, value) async {
    try{
      String jsonData = json.encode(value);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey(email)){
        SnackBarUtils.show(title: "Account already Registered with this email", isError: false);
      }else{
        prefs.setString(email, jsonData);
        SnackBarUtils.show(title: "Registered Successfully!", isError: false);
      }
      return true;
    }catch(e){
      LogUtil().log(msg: "registerUser() : $e");
      return false;
    }
  }
  Future<void> loginUser(String email,String name , String password,bool rememberMe, BuildContext context)async {
    try{
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey(email)){
        final data   = json.decode(prefs.getString(email)!);
        if(data['name'] == name && data['email'] == email && data['password'] == password){
          if(rememberMe == true){
            prefs.setString(userKey, email);
          }
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => DashboardScreen(user: User.fromJson(data),),), (route) => false);
        }else{
          SnackBarUtils.show(title: "Sorry, you entered wrong credentials!", isError: false);
        }
      }else{
        SnackBarUtils.show(title: "Sorry, account not found!", isError: false);
      }

    }catch(e){
      LogUtil().log(msg: "loginUser() : $e");

    }
  }

  Future<Map<String,dynamic>> check() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? user = prefs.getString(userKey);

    if( user != null ){
      String data = prefs.getString(user)!;
      if(data.isNotEmpty){
        return json.decode(data);
      }else{
        return {};
      }

    }else{
      return {};
    }
  }
  Future<void> signOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
   prefs.remove(userKey);
  }
}