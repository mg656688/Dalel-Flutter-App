import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/forget_password_text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomSignInForm extends StatelessWidget {
  const CustomSignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
         if(state is SignInSuccessState){
          FirebaseAuth.instance.currentUser!.emailVerified?
          customReplacementNavigate(context, "/homeNavBar")
          :showToast("Please verify your account");
        }else if( state is SignInFailureState){
        showToast(state.errorMessage);
        }
      },
      builder: (context , state){
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key:authCubit.signinFormKey ,
      child: Column(
        children: [
           CustomTextFormField(
            labelText: AppStrings.emailAddress,
          onChanged: (emailAddress){
            authCubit.emailAddress=emailAddress;
          }),

          CustomTextFormField(
                labelText: AppStrings.password,
                suffixIcon: IconButton(
                  icon: Icon(
                    authCubit.obscurePasswordTextValue?
                    Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                  ), 
                  onPressed: () {
                    authCubit.obscurePasswordText(); 
                     },
                  ),
                 obscureText: authCubit.obscurePasswordTextValue,
                 onChanged: (password){
                  authCubit.password =password;
                 },
                ),
          const SizedBox(height: 16,),
          const ForgetPasswordTextWidget(),    
          const SizedBox(height: 100,),
          state is SignInLoadingState
          ? CircularProgressIndicator(color: AppColors.primaryColor)
          : CustomBtn( 
            onPressed: ()async{
           
                 if (authCubit.signinFormKey.currentState!.validate()) {
                 await authCubit.signInWithEmailAndPassword();
                 }

           }, text: AppStrings.signIn ),
        ],
    ),
        );
    },);
  }
}
