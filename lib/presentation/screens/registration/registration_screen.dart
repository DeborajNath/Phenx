import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';

import 'package:flutter_sizer/flutter_sizer.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:phenx/main.dart';
import 'package:phenx/presentation/screens/login/login.dart';

import 'package:phenx/presentation/widgets/index.dart';
import 'package:phenx/utils/constant/index.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isEmailValid = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _isSuccess = false;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const LoginUserIdScreen();
        } else {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: Colors.white,
                statusBarIconBrightness: Brightness.dark,
                statusBarBrightness: Brightness.light,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: AppBarLeading(
                onTap: () {
                  PromptExit.promptUser(context, true);
                },
              ),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: (PaddingConstants.horizontalPadding /
                        Dimensions.designWidth)
                    .w,
              ),
              child: FocusScope(
                autofocus: false,
                child: Column(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Let's get Started",
                            style: TextStyles.primaryBold.copyWith(
                              color: Colors.black,
                              fontSize: (28 / Dimensions.designWidth).w,
                            ),
                          ),
                          const SizeBox(height: 23),
                          Text(
                            "This Email address will be used as your User ID for your account",
                            style: TextStyles.primaryMedium.copyWith(
                              color: Colors.black45,
                              fontSize: (16 / Dimensions.designWidth).w,
                            ),
                          ),
                          const SizeBox(height: 36),
                          Row(
                            children: [
                              Text(
                                "Email Address",
                                style: TextStyles.primaryMedium.copyWith(
                                  color: Colors.black,
                                  fontSize: (16 / Dimensions.designWidth).w,
                                ),
                              ),
                              const Asterisk(),
                            ],
                          ),
                          const SizeBox(
                            height: 14,
                          ),
                          CustomTextField(
                            borderColor: (emailController.text.contains('@') &&
                                    emailController.text.contains('.'))
                                ? _isEmailValid ||
                                        emailController.text.isEmpty ||
                                        !emailController.text.contains('@') ||
                                        (emailController.text.contains('@') &&
                                            (RegExp("[A-Za-z0-9.-]").hasMatch(
                                                emailController.text
                                                    .split('@')
                                                    .last)) &&
                                            !(emailController.text
                                                .split('@')
                                                .last
                                                .contains(
                                                  RegExp(
                                                      r'[!@#$%^&*(),_?":{}|<>\/\\]'),
                                                )))
                                    ? const Color(0xFFEEEEEE)
                                    : Colors.red
                                : const Color(0xFFEEEEEE),
                            controller: emailController,
                            suffixIcon: buildCheckCircle(context),
                            onChanged: emailValidation,
                          ),
                          const SizeBox(
                            height: 24,
                          ),
                          Row(
                            children: [
                              Text(
                                "Password",
                                style: TextStyles.primaryMedium.copyWith(
                                  color: Colors.black,
                                  fontSize: (14 / Dimensions.designWidth).w,
                                ),
                              ),
                              const Asterisk(),
                            ],
                          ),
                          const SizeBox(
                            height: 14,
                          ),
                          CustomTextField(
                            minLines: 1,
                            maxLines: 1,
                            controller: _passwordController,
                            obscureText: _obscurePassword,
                            suffixIcon: IconButton(
                              icon: _obscurePassword
                                  ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.black38,
                                      size: (17.5 / Dimensions.designWidth).w,
                                    )
                                  : Icon(
                                      Icons.visibility_outlined,
                                      color: const Color(0xffD19B2A),
                                      size: (17.5 / Dimensions.designWidth).w,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),
                            onChanged: (p0) {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          Row(
                            children: [
                              Text(
                                "Confirm Password",
                                style: TextStyles.primaryMedium.copyWith(
                                  color: Colors.black,
                                  fontSize: (14 / Dimensions.designWidth).w,
                                ),
                              ),
                              const Asterisk(),
                            ],
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          CustomTextField(
                            minLines: 1,
                            maxLines: 1,
                            controller: _confirmPasswordController,
                            obscureText: _obscureConfirmPassword,
                            suffixIcon: IconButton(
                              icon: _obscureConfirmPassword
                                  ? Icon(
                                      Icons.visibility_off_outlined,
                                      color: Colors.black38,
                                      size: (17.5 / Dimensions.designWidth).w,
                                    )
                                  : Icon(
                                      Icons.visibility_outlined,
                                      color: const Color(0xffD19B2A),
                                      size: (17.5 / Dimensions.designWidth).w,
                                    ),
                              onPressed: () {
                                setState(() {
                                  _obscureConfirmPassword =
                                      !_obscureConfirmPassword;
                                });
                              },
                            ),
                            onChanged: (p0) {},
                          ),
                          const SizedBox(
                            height: 14,
                          ),
                          FlutterPwValidator(
                              uppercaseCharCount: 1,
                              numericCharCount: 1,
                              specialCharCount: 1,
                              width: 100.w,
                              height: 130,
                              minLength: 8,
                              onSuccess: () {
                                setState(() {
                                  _isSuccess = true;
                                });
                              },
                              controller: _passwordController),
                        ],
                      ),
                    ),
                    buildSubmitButton(context),
                    SizeBox(
                      height: PaddingConstants.bottomPadding +
                          MediaQuery.of(context).padding.bottom,
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Widget buildCheckCircle(BuildContext context) {
    if (!_isEmailValid) {
      return Padding(
        padding: EdgeInsets.only(right: (18 / Dimensions.designWidth).w),
        child: InkWell(
          onTap: () {
            emailController.clear();
          },
          child: SvgPicture.asset(
            ImageConstants.deleteText,
            width: (17.5 / Dimensions.designWidth).w,
            height: (17.5 / Dimensions.designWidth).w,
          ),
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.only(right: (18 / Dimensions.designWidth).w),
        child: SvgPicture.asset(
          ImageConstants.checkCircle,
          width: (20 / Dimensions.designWidth).w,
          height: (20 / Dimensions.designWidth).w,
        ),
      );
    }
  }

  void emailValidation(String p0) {
    setState(() {
      _isEmailValid = EmailValidator.validate(p0);
    });
  }

  Widget buildSubmitButton(BuildContext context) {
    if (_isEmailValid &&
        _passwordController.text.isNotEmpty &&
        _confirmPasswordController.text.isNotEmpty &&
        _isSuccess &&
        _passwordController.text == _confirmPasswordController.text) {
      return GradientButton(
        onTap: () {
          FocusScope.of(context).unfocus();
          signup();
        },
        text: "SignUp",
      );
    } else {
      return SolidButton(onTap: () {}, text: "Signup");
    }
  }

  Future signup() async {
    showDialog(
        context: context,
        builder: (context) => const Center(
              child: CircularProgressIndicator(),
            ));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: _passwordController.text.trim());
      // UtilsGreen.showSnackBar('Account has been created');
    } on FirebaseAuthException catch (e) {
      // ignore: avoid_print
      print(e);
      FocusScope.of(context).unfocus();
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }
}
