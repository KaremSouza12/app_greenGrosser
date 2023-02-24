import 'package:app_greengrosser/src/auth/sigin_up_screen.dart';
import 'package:app_greengrosser/src/auth/signin_screen.dart';
import 'package:app_greengrosser/src/base/base_screen.dart';
import 'package:go_router/go_router.dart';

const initialRoute = '/';
const signinUpRoute = '/signin_up';
const baseScreenRoute = '/base_screen';

final routes = GoRouter(routes: [
  GoRoute(
    path: initialRoute,
    builder: (_, __) => const SignInScreen(),
  ),
  GoRoute(
    path: signinUpRoute,
    builder: (_, __) => SigninUpScreen(),
  ),
  GoRoute(
    path: baseScreenRoute,
    builder: (_, __) => const BaseScreen(),
  ),
]);
