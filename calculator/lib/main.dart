import 'package:flutter/material.dart';
import 'package:calculator/appEntry.dart';
import 'package:calculator/config.dart';

void main(){
  Config.appFlavor = Flavor.RELEASE;
  runApp(Calculator());
}
