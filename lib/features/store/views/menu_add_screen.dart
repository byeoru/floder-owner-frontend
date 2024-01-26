import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuAddScreen extends ConsumerStatefulWidget {
  static const String routeUrl = "menu";
  static const String routeName = "menuAdd";

  const MenuAddScreen({super.key});

  @override
  MenuAddScreenState createState() => MenuAddScreenState();
}

class MenuAddScreenState extends ConsumerState<MenuAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("메뉴 추가"),
      ),
      body: Container(),
    );
  }
}
