import 'package:floder_owner/navigation/bottom_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/order",
    routes: [
      GoRoute(
        path: "/:tab(order|waiting|manage|me)",
        builder: (context, state) {
          final tab = state.pathParameters["tab"]!;
          return BottomNavScreen(tab: tab);
        },
      )
    ],
  );
});
