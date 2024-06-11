

import 'package:flutter/foundation.dart';

class LogUtil{
  void log({required String msg}){
    if(kDebugMode){
      print(msg);
    }
  }
}