import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future openPageIOS(Widget page, BuildContext context) async {
  final route = CupertinoPageRoute(builder: (BuildContext context) => page);
  return await Navigator.of(context).push(route);
}
Future openPageAndroid(Widget page, BuildContext context) async{
  final route = MaterialPageRoute(builder: (BuildContext context) => page);
  return await Navigator.of(context).push(route);
}
void closePage(BuildContext context){
  Navigator.of(context).pop();
}

