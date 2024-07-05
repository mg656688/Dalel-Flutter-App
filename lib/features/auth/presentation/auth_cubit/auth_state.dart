 class AuthState {}

final class AuthInitial extends AuthState{}

final class SignUpLoadingState extends AuthState{}

final class SignUpSuccessState extends AuthState{}

final class SignUpFailureState extends AuthState{
  final String errorMessage;

  SignUpFailureState({required this.errorMessage});

}

final class SignInLoadingState extends AuthState{}

final class SignInSuccessState extends AuthState{}

final class SignInFailureState extends AuthState{
  final String errorMessage;

  SignInFailureState({required this.errorMessage}); 
}

final class ResetPasswordLoadingState extends AuthState{}

final class ResetPasswordSuccessState extends AuthState{}

final class ResetPasswordFailureState extends AuthState{
  final String errorMessage;

  ResetPasswordFailureState({required this.errorMessage}); 
}

final class TermsAndConditionUpdateState extends AuthState{}

final class ObscurePasswordTextUpdateState extends AuthState{}



