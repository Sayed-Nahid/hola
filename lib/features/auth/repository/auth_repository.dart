import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hola/common/utils/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hola/features/auth/screens/otp_screen.dart';
import 'package:riverpod/riverpod.dart';

import '../screens/user_information_screen.dart';

final authRepositoryProvider = Provider(
    (ref) => AuthRepository(
        auth: FirebaseAuth.instance,
        firestore: FirebaseFirestore.instance
    ),
);

class AuthRepository{
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  AuthRepository({
    required this.auth,
    required this.firestore,
});

  void singInWithPhone(BuildContext context, String phoneNumber) async{
    try {
      await auth.verifyPhoneNumber( phoneNumber: phoneNumber, verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
      }, verificationFailed: (e) {
        throw Exception(e.message);
      }, codeSent: ((String verificationId, int? resendToken) async {
        Navigator.pushNamed(context, OTPScreen.routeName, arguments: verificationId);
      }), codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } on FirebaseAuthException catch (e){
      showSnackBar(context: context, content: e.message!);
    }
  }

  void verifyOTP({
    required BuildContext context,
    required String verificationId,
    required String userOTP,
}) async{
    try{
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: userOTP,
      );
      await auth.signInWithCredential(credential);
      Navigator.pushNamedAndRemoveUntil(
        context,
        UserInformationScreen.routeName,
          (route) => false,
      );
    } on FirebaseAuthException catch(e){
      showSnackBar(context: context, content: e.message!);
    }
  }

}