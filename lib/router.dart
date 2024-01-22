import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    initialLocation: "/order",
    routes: [
      GoRoute(
        path: "/order",
      ),
      GoRoute(
        path: "/waiting",
      ),
      GoRoute(
        path: "/manage",
      ),
      GoRoute(
        path: "/me",
      ),
    ],
  );
});
