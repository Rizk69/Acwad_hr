import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hr/app/app_prefs.dart';
import 'package:hr/app/di.dart';
import 'package:hr/app/functions.dart';
import 'package:hr/data/network/requests.dart';
import 'package:hr/generated/locale_keys.g.dart';
import 'package:hr/presentation/login/manger/login_cubit.dart';
import 'package:hr/presentation/resources/assets_manager.dart';
import 'package:hr/presentation/resources/color_manager.dart';
import 'package:hr/presentation/resources/values_manager.dart';
import 'package:hr/presentation/widget/auth_screen_decoration.dart';
import 'package:hr/presentation/widget/custom_auth_button.dart';
import 'package:hr/presentation/widget/custom_text_field.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/routes_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LoginCubit loginCubit = instance<LoginCubit>();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? emailErrorMsg;
  String? passwordErrorMsg;
  bool isAllValid = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<LoginCubit>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          decoration: getAuthScreenDecoration(),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/pattern top.png',
                  ),
                ),
              ),
              ListView(
                physics: const BouncingScrollPhysics(),
                children: <Widget>[
                  SizedBox(
                    height: AppSize.s30.h,
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    padding: EdgeInsets.only(top: AppPadding.p2.h),
                    decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(AppSize.s5.h),
                            topLeft: Radius.circular(AppSize.s5.h))),
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: AppPadding.p8.w, left: AppPadding.p8.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                                'assets/images/logo_omran-removebg-preview 1.png',
                                height: AppSize.s15.h),
                            SizedBox(height: AppSize.s1_7.h),
                            SizedBox(height: AppSize.s03.dp),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
                              child: CustomAuthFormFiled(
                                keyboardType: TextInputType.name,
                                controller: _emailController,
                                cursorColor: ColorManager.baseColor,
                                autofillHints: const [AutofillHints.name],
                                textInputAction: TextInputAction.next,
                                hintText: "Email",
                                onChanged: loginCubit.updateEmail,
                                validator: validateEmail,
                                errorText: emailErrorMsg,
                                textDirection: getTextDirection(context),
                              ),
                            ),
                            SizedBox(
                              height: AppSize.s1_5.h,
                            ),
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: AppPadding.p4.w),
                              child: CustomAuthFormFiled(
                                keyboardType: TextInputType.visiblePassword,
                                controller: _passwordController,
                                cursorColor: ColorManager.baseColor,
                                validator: validatePassword,
                                autofillHints: const [AutofillHints.password],
                                obscureText:
                                    context.read<LoginCubit>().showPassword,
                                textInputAction: TextInputAction.done,
                                hintText: LocaleKeys.password.tr(),
                                onChanged: loginCubit.updatePassword,
                                errorText: passwordErrorMsg,
                                textDirection: getTextDirection(context),
                                suffixIcon: InkWell(
                                  onTap: () =>
                                      context.read<LoginCubit>().setPasswordIcon(),
                                  child: Icon(
                                    context.read<LoginCubit>().suffixIcon,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: AppSize.s6.h),
                            CustomAuthButton(
                              buttonName: LocaleKeys.signIn.tr(),
                              isLoading: isLoading,
                              onTap: () {
                                {
                                  Navigator.pushNamed(context, Routes.homeRoute);
                                }
                                // context.read<LoginCubit>().login(
                                //     LoginRequest(
                                //         email: "mostafa@yahoo.com",
                                //         password: "123456789")
                                // );
                                //       if (_formKey.currentState!.validate()) {
                                //          context.read<LoginCubit>().login(
                                //              LoginRequest(
                                //                  email: _emailController.text
                                //                      .trim(),
                                //                  password: _passwordController
                                //                      .text
                                //                      .trim()));
                                //        }
                              },
                            ),
                            SizedBox(height: AppSize.s1.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
