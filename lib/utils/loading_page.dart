import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  bool check;

  LoadingPage({Key? key, this.check = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Visibility(
          visible: check,
          child: const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          )),
    );
  }
}
