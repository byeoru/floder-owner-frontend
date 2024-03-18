import 'package:floder_owner/features/auth/views/login_screen.dart';
import 'package:floder_owner/features/store/views/menu_detail_screen.dart';
import 'package:floder_owner/navigation/bottom_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/login",
    routes: [
      GoRoute(
        path: LoginScreen.routeUrl,
        name: LoginScreen.routeName,
        builder: (context, state) => const LoginScreen(),
      ),
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
        ],
      ),
    ],
  );
});
