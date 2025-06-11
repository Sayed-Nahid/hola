import 'package:flutter/material.dart';
import 'package:hola/colors.dart';
import 'package:hola/common/widgets/custom_button.dart';
import '../../auth/screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  void navigateToLoginScreen(BuildContext context){
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              const Text('Welcome to Hola!',
                style: TextStyle(
                  fontSize: 33,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: size.height/9),
              Image.asset('assets/bg.png', height: 340, width: 340, color: tabColor,),
              SizedBox(height: size.height/9),
              const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    'Yo Dude Read our Privacy Policy and Hit the agree button.',
                    style: TextStyle(color: greyColor),
                    textAlign: TextAlign.center,
                  ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: size.width*0.75,
                  child: CustomButton(text: 'AGREE AND CONTINUE',
                    onPressed: () => navigateToLoginScreen(context),),),
            ],
          ),
        ),
      ),
    );
  }
}
