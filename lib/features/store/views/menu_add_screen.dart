import 'package:floder_owner/constants/gaps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuAddScreen extends ConsumerStatefulWidget {
  static const String routeUrl = "menu";
  static const String routeName = "menuAdd";

  const MenuAddScreen({super.key});

  @override
  ConsumerState<MenuAddScreen> createState() => _MenuAddScreenState();
}

class _MenuAddScreenState extends ConsumerState<MenuAddScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: CloseButton(
          color: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("저장"),
          ),
        ],
      ),
      body: Column(
        children: [
          Gaps.v20,
          ListTile(
            leading: const Icon(FontAwesomeIcons.signature),
            title: const Text("메뉴명"),
            trailing: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const CupertinoTextField(
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Gaps.v10,
          ListTile(
            leading: const Icon(FontAwesomeIcons.list),
            title: const Text("메뉴 설명"),
            trailing: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const CupertinoTextField(
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          Gaps.v10,
          ListTile(
            leading: const Icon(FontAwesomeIcons.moneyCheckDollar),
            title: const Text("가격"),
            trailing: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 250),
              child: const CupertinoTextField(
                clearButtonMode: OverlayVisibilityMode.editing,
                keyboardType: TextInputType.number,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
