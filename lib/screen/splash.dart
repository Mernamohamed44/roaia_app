import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:roaia_app/core/helpers/cache_helper.dart';
import 'package:roaia_app/localization/localization_methods.dart';
import 'package:roaia_app/screen/botton_bar.dart';
import 'package:roaia_app/screen/onboarding.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({super.key});

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      String token = CacheHelper.get(key: "access_token") ?? "";
      print(token);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) =>
                token.isNotEmpty ? NavigationBottom() : Onborading_Screen(),
          ),
          (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedTextKit(
          animatedTexts: [
            WavyAnimatedText(
              tr("Roaia", context),
              textStyle: const TextStyle(
                  fontSize: 65,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff1363DF)),
            ),
          ],
          isRepeatingAnimation: true,
        ),
      ),
    );
  }
}
