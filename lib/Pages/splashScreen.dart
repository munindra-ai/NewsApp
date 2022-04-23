import 'package:flutter/material.dart';
import 'package:newsapp/Pages/homeScreen.dart';
import 'package:newsapp/constant/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigator();
  }

  navigator() async {
    await Future.delayed(const Duration(seconds: 5), () {
      navigatorToMain();
    });
  }

  navigatorToMain() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    const backgroundImage =
        'https://www.kindpng.com/picc/m/0-3728_background-frame-border-decorative-ornamental-border-frame-png.png';
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(backgroundImage), fit: BoxFit.fill)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "We show news for you!",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: bgColor,
                  ),
                  onPressed: () {
                    navigatorToMain();
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: textColor, fontSize: 18),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
