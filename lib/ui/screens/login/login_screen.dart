import 'package:bloc_fake_store_api/core/constants/colors.dart';
import 'package:bloc_fake_store_api/core/constants/text_styles.dart';
import 'package:bloc_fake_store_api/core/utils/screen_utilities.dart';
import 'package:bloc_fake_store_api/core/utils/utils.dart';
import 'package:bloc_fake_store_api/core/utils/validators.dart';
import 'package:bloc_fake_store_api/ui/screens/all_products/all_products_screen.dart';
import 'package:bloc_fake_store_api/ui/screens/login/bloc/login_bloc.dart';
import 'package:bloc_fake_store_api/ui/widgets/custom_button.dart';
import 'package:bloc_fake_store_api/ui/widgets/custom_textfield.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  final emailC = TextEditingController();
  final passwordC = TextEditingController();

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginBloc(),
      child: GestureDetector(
        onTap: () {
          if (FocusScope.of(context).hasFocus) {
            FocusScope.of(context).unfocus();
          }
        },
        child: Scaffold(
          body: BlocConsumer<LoginBloc, LoginState>(
            listener: (context, state) {
              // TODO: implement listener

              if (state.isLoggedIn) {
                Navigator.pushNamed(context, AllProductsScreen.routeName);
              }
              if (state.errorMsg.isNotEmpty) {
                Utils.showFlushBar(context, "Error", state.errorMsg);
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    ///50% Container with center text and bottom left
                    Container(
                      height: 50.h,
                      width: 100.w,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(begin: Alignment.centerLeft, colors: [
                        AppColors.colorPrimaryDark,
                        AppColors.colorPrimary,
                      ])),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(),
                          Text(
                            'STC\nHealth',
                            textAlign: TextAlign.center,
                            style: normalTextStyle.copyWith(
                              fontSize: 36.px,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 28.0.sp, left: 20.sp),
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Log In',
                                  style: normalTextStyle.copyWith(
                                    fontSize: 34.px,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),

                    ///Text Fields
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0.sp),
                        child: Form(
                          key: formKey,
                          child: Column(
                            children: [
                              kHeight(3.h),
                              CustomTextField(
                                controller: emailC,
                                hintText: 'Email',
                                labelText: 'Email',
                                validator: validateNormalField,
                              ),
                              kHeight(3.h),

                              CustomTextField(
                                controller: passwordC,
                                hintText: 'Password',
                                labelText: 'Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    print('event added');

                                    context.read<LoginBloc>().add(LoginTogglePasswordVisibilityEvent());
                                  },
                                  child: Icon(
                                    state.isShowPassword ? Icons.visibility_off : Icons.visibility,
                                    color: Colors.grey,
                                  ),
                                ),
                                obscureText: state.isShowPassword ? true : false,
                                validator: validatePasswordField,
                              ),

                              kHeight(4.h),

                              ///Continue Button

                              state.isLoading
                                  ? const Center(
                                      child: CircularProgressIndicator(),
                                    )
                                  : CustomButton(
                                      onTap: () {
                                        // vm.handleLoginTap(context);
                                        context.read<LoginBloc>().add(LoginButtonEvent(
                                              email: emailC.text,
                                              password: passwordC.text,
                                            ));
                                      },
                                      // isLoading: vm.isLoading,
                                      text: 'Continue',
                                    ),

                              kHeight(2.h),

                              ///Need Help Text
                              Text('Need Help?', style: normalTextStyle2)
                            ],
                          ),
                        ))
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
