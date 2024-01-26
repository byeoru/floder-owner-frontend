import 'package:floder_owner/features/store/views/menu_add_screen.dart';
import 'package:floder_owner/features/store/views/menu_detail_screen.dart';
import 'package:floder_owner/navigation/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/order",
    routes: [
      GoRoute(
        path: "/:tab($formattedTaps)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return BottomNavScreen(tab: tab);
        },
        routes: [
          GoRoute(
            path: "${MenuDetailScreen.routeUrl}/:pk",
            name: MenuDetailScreen.routeName,
            builder: (context, state) {
              final pk = state.pathParameters["pk"]!;
              final menuName = state.extra as String;
              return MenuDetailScreen(
                pk: pk,
                name: menuName,
              );
            },
          ),
          GoRoute(
            path: MenuAddScreen.routeUrl,
            name: MenuAddScreen.routeName,
            pageBuilder: (context, state) => const MaterialPage(
              fullscreenDialog: true,
              child: MenuAddScreen(),
            ),
          ),
        ],
      ),
    ],
  );
});
