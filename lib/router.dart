import 'package:floder_owner/navigation/bottom_nav.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final String formattedTaps =
    ETabs.values.map((tap) => tap.toString()).join("|");

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
      ),
    ],
  );
});
