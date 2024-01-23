import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailScreen extends ConsumerWidget {
  static const String routeUrl = "/menu";
  static const String routeName = "menu";
  final String pk;

  const MenuDetailScreen({
    super.key,
    required this.pk,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("menu $pk"),
      ),
    );
  }
}
