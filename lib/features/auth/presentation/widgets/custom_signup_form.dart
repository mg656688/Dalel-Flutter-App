import 'package:dalel/core/functions/custom_toast.dart';
import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/core/utils/app_strings.dart';
import 'package:dalel/core/widgets/custom_btn.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_cubit.dart';
import 'package:dalel/features/auth/presentation/auth_cubit/auth_state.dart';
import 'package:dalel/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:dalel/features/auth/presentation/widgets/terms_and_condition_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class CustomSignUpForm extends StatelessWidget {
  const CustomSignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit,AuthState>(
      listener: (context,state){
        if(state is SignUpSuccessState){
          showToast("Successfully , Check your email to verfiy ypur account");
          customReplacementNavigate(context, "/signIn");
        }else if( state is SignUpFailureState){
        showToast(state.errorMessage);
        }
      },
      builder: (context , state){
        AuthCubit authCubit = BlocProvider.of<AuthCubit>(context);
        return Form(
          key:authCubit.signupFormKey ,
      child: Column(
        children: [
         CustomTextFormField(
          labelText: AppStrings.firstName,
          onChanged: (firstName){
           authCubit.firstName=firstName;
          },),
         CustomTextFormField(
          labelText: AppStrings.lastName,
          onChanged: (lastName){
            authCubit.lastName=lastName;
          },),
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
               
          const SizedBox(height: 20,) ,
          const TermsAndConditionWidget(),
          const SizedBox(height: 40,),
          state is SignUpLoadingState
          ? CircularProgressIndicator(color: AppColors.primaryColor)
          : CustomBtn( 
           color: authCubit.termsAndConditionCheckBoxValue==false?
            AppColors.grey
             :null,
            onPressed: ()async{
            if (authCubit.termsAndConditionCheckBoxValue==true) {
                 if (authCubit.signupFormKey.currentState!.validate()) {
                   await authCubit.signUpWithEmailAndPassword();
  }
}
           }, text: AppStrings.signUp ),
        ],
    ),
        );
    },);
  }
}