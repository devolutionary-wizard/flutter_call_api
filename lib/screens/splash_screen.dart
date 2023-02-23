import 'package:flutter/material.dart';
import 'package:flutter_call_api/costants/constant.dart';
import 'package:flutter_call_api/screens/post_page/post_page_screen.dart';
import 'package:flutter_call_api/utils/mixin/device_checker.dart';
import 'package:flutter_call_api/utils/page_navigator.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with DeviceChecker {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () async {
      if (isIOS) {
        openPageIOS(const PostPageScreen(), context);
      } else {
        openPageAndroid(const PostPageScreen(), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.imgLogo,
                  width: 100,
                  height: 100,
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Flutter Rest API',
                  style: TextStyle(color: Colors.black, fontSize: 20),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
