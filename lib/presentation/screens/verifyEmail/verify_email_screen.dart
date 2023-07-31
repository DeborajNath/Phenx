// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_sizer/flutter_sizer.dart';

// import 'package:phenx/presentation/screens/login/login.dart';
// import 'package:phenx/utils/constant/index.dart';

// class VerifyEmailScreen extends StatefulWidget {
//   const VerifyEmailScreen({super.key});

//   @override
//   State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
// }

// class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
//   bool isEmailVerified = false;
//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

//     if (!isEmailVerified) {
//       sendVerificationEmail();

//       timer = Timer.periodic(
//         const Duration(seconds: 3),
//         (_) => checkEmailVerified(),
//       );
//     }
//   }

//   @override
//   void dispose() {
//     timer?.cancel();
//     super.dispose();
//   }

//   Future checkEmailVerified() async {
//     await FirebaseAuth.instance.currentUser?.reload();
//     setState(() {
//       isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;
//     });
//     if (isEmailVerified) timer?.cancel();
//   }

//   Future sendVerificationEmail() async {
//     try {
//       final user = FirebaseAuth.instance.currentUser!;
//       await user.sendEmailVerification();
//     } catch (e) {
//       Utils.showSnackBar(e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) => isEmailVerified
//       ? const LoginUserIdScreen()
//       : Scaffold(
//           appBar: AppBar(
//             systemOverlayStyle: const SystemUiOverlayStyle(
//               statusBarColor: Colors.white,
//               statusBarIconBrightness: Brightness.dark,
//               statusBarBrightness: Brightness.light,
//             ),
//             backgroundColor: Colors.transparent,
//             elevation: 0,
//             title: Text(
//               'Verify Email',
//               style: TextStyles.primaryBold.copyWith(
//                 color: Colors.black,
//                 fontSize: (20 / Dimensions.designWidth).w,
//               ),
//             ),
//           ),
//           body: Padding(
//             padding: EdgeInsets.symmetric(
//               horizontal:
//                   (PaddingConstants.horizontalPadding / Dimensions.designWidth)
//                       .w,
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text(
//                   "Once you verify your Email, you will be redirected to Login Page",
//                   textAlign: TextAlign.center,
//                   style: TextStyles.primaryBold.copyWith(
//                     color: Colors.black54,
//                     fontSize: (24 / Dimensions.designWidth).w,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
// }
