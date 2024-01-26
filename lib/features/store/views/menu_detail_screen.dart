import 'package:floder_owner/constants/gaps.dart';
import 'package:floder_owner/constants/sizes.dart';
import 'package:floder_owner/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MenuDetailScreen extends ConsumerWidget {
  static const String routeUrl = "menu";
  static const String routeName = "menuDetail";
  final String pk;
  final String name;

  const MenuDetailScreen({
    super.key,
    required this.pk,
    required this.name,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            stretch: true,
            snap: true,
            collapsedHeight: 100,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.fadeTitle,
                StretchMode.blurBackground,
              ],
              background: Image.asset(
                "assets/images/test.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Utils.appHorizontalPaddingSize,
              ),
              child: Column(
                children: [
                  Gaps.v32,
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white38,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          Sizes.size20,
                        ),
                      ),
                    ),
                    child: CupertinoTextField(
                      placeholder: name,
                      clearButtonMode: OverlayVisibilityMode.editing,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
