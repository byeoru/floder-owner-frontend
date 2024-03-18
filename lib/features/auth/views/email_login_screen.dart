import 'package:floder_owner/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmailLoginScreen extends StatefulWidget {
  const EmailLoginScreen({super.key});

  @override
  State<EmailLoginScreen> createState() => _EmailLoginScreenState();
}

class _EmailLoginScreenState extends State<EmailLoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Utils.isDarkMode(context) ? null : Colors.white,
      ),
      body: const Column(
        children: [
          CupertinoTextField(),
          CupertinoTextField(),
        ],
      ),
    );
  }
}
