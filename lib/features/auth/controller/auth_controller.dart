import 'package:flutter/cupertino.dart';
import 'package:riverpod/riverpod.dart';
import 'package:hola/features/auth/repository/auth_repository.dart';
final authControllerProvider = Provider((ref){
  final authRepository = ref.watch(authRepositoryProvider);
  return AuthController(authRepository: authRepository);
});

class AuthController{
  final AuthRepository authRepository;
  AuthController({
    required this.authRepository,
});
  void signInWithPhone(BuildContext context, String phoneNumber){
    authRepository.singInWithPhone(context, phoneNumber);
  }

  void verifyOTP(BuildContext context, String verificationId, String userOTP) {
    authRepository.verifyOTP(context: context, verificationId: verificationId, userOTP: userOTP);
  }
}