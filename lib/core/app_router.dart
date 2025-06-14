import 'package:go_router/go_router.dart';

import '../presentation/screens/base_layout.dart';
import '../presentation/screens/home_screen.dart';
import '../presentation/screens/login_screen.dart';
import '../presentation/screens/property_screen.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/home',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return BaseLayout(currentRoute: state.name ?? 'home', child: child);
      },
      routes: [
        GoRoute(
          name: 'home',
          path: '/home',
          builder: (context, state) => const HomeScreen(),
        ),
        // add a route for property screen
        GoRoute(
          name: 'property',
          path: '/property',
          builder: (context, state) => const PropertyScreen(),
        ),
        GoRoute(
          name: 'login',
          path: '/login',
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    ),
  ],
  // errorBuilder: (context, state) => ErrorScreen(
  //   errorMessage: state.error.toString(),
  // ),
);
