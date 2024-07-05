import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/database/cache/cache_helper.dart';
import '../../../../core/services/service_locator.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  String? firstName;
  String? lastName;
  String? emailAddress;
  String? password;
  bool termsAndConditionCheckBoxValue = false;
  bool obscurePasswordTextValue = true;

  GlobalKey<FormState> signupFormKey = GlobalKey();
  GlobalKey<FormState> signinFormKey = GlobalKey();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey();


  Future<void> signUpWithEmailAndPassword() async {
    try {
      emit(SignUpLoadingState());
      final userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );

      await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set({
        "email": emailAddress,
        "first_name": firstName,
        "last_name": lastName,
      });

      await verifyEmail(); // Call verifyEmail after successful signup
      emit(SignUpSuccessState());

    } on FirebaseAuthException catch (e) {
      _signUpHandleException(e);
    } catch (e) {
      emit(SignUpFailureState(errorMessage: e.toString()));
    }
  }


  void _signUpHandleException(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(SignUpFailureState(
          errorMessage: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(SignUpFailureState(
          errorMessage: 'The account already exists for that email.'));
    } else if (e.code == "invalid-email") {
      emit(SignUpFailureState(errorMessage: "The email is invalid"));
    } else {
      emit(SignUpFailureState(errorMessage: e.code));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  void updateTermsAndConditionCheckBok({required newValue}) {
    termsAndConditionCheckBoxValue = newValue;
    emit(TermsAndConditionUpdateState());
  }

  void obscurePasswordText() {
    obscurePasswordTextValue = !obscurePasswordTextValue;
    emit(ObscurePasswordTextUpdateState());
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(SignInLoadingState());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress!,
        password: password!,
      );
      emit(SignInSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(SignInFailureState(
            errorMessage: "No user found for that email."));
      } else if (e.code == 'wrong-password') {
        emit(SignInFailureState(
            errorMessage: "Wrong password provided for that user."));
      } else {
        emit(SignInFailureState(
            errorMessage: "Check your email and password"));
      }
    } catch (e) {
      emit(SignInFailureState(errorMessage: e.toString()));
    }
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(ResetPasswordLoadingState());
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailAddress!);
      emit(ResetPasswordSuccessState());
    } catch (e) {
      emit(ResetPasswordFailureState(errorMessage: e.toString()));
    }
  }
}
