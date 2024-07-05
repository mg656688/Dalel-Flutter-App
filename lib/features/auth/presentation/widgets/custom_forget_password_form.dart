import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomForgetPasswordForm extends StatelessWidget {
  const CustomForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is ResetPasswordSuccessState){
           showToast("Check your emai to reset your password");
           customReplacementNavigate(context, "signIn");
        }else if (state is ResetPasswordFailureState){
           showToast(state.errorMessage);
        }
      },
      builder: (context , state){
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Form(
            key:authCubit.forgetPasswordFormKey ,
              child: Column(
          children: [
             CustomTextFormField(
              labelText: AppStrings.emailAddress,
            onChanged: (emailAddress){
              authCubit.emailAddress=emailAddress;
            }),
            const SizedBox(height: 100,),
            state is ResetPasswordLoadingState
            ?CircularProgressIndicator(color: AppColors.primaryColor)
            : CustomBtn( 
              onPressed: ()async{
             
                   if (authCubit.forgetPasswordFormKey.currentState!.validate()) {
                   await authCubit.resetPasswordWithLink();
                   }
        
             }, text: AppStrings.sendResetPasswordLink),
             const SizedBox(height: 100,)
          ],
            ),
          ),
        );
    },);
  }
}