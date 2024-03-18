import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/features/auth/views/email_login_screen.dart';
import 'package:floder_owner/features/auth/views/widgets/login_type_btn_widget.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeUrl = "/login";
  static const String routeName = "login";

  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  void _onEmailTap() {
    Utils.materialPush(context: context, page: const EmailLoginScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.isDarkMode(context) ? null : Colors.white,
      appBar: AppBar(
        backgroundColor: Utils.isDarkMode(context) ? null : Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Utils.appHorizontalPaddingSize,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            LoginTypeBtnWidget(
              title: "이메일로 계속하기",
              icon: FontAwesomeIcons.envelope,
              color: Colors.black12,
              onTap: _onEmailTap,
            ),
            Gaps.v10,
            LoginTypeBtnWidget(
              title: "카카오로 계속하기",
              icon: FontAwesomeIcons.solidComment,
              color: Colors.yellow,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
