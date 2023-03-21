import 'package:app_greengrosser/src/models/item_models.dart';

import 'package:app_greengrosser/src/pages/auth/sigin_up_screen.dart';
import 'package:app_greengrosser/src/pages/auth/signin_screen.dart';
import 'package:app_greengrosser/src/pages/base/base_screen.dart';
import 'package:app_greengrosser/src/pages/product/product_screen.dart';
import 'package:app_greengrosser/src/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

const initialRoute = '/';
const signInRoute = '/sign_in';
const signinUpRoute = '/signin_up';
const baseScreenRoute = '/base_screen';
const productScreenRoute = '/product_screen';
// const testeRota = '/';

final routes = GoRouter(routes: [
  GoRoute(
    path: initialRoute,
    builder: (_, __) => const SplashScreen(),
  ),
  GoRoute(
    path: signInRoute,
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
  GoRoute(
    path: productScreenRoute,
    builder: (_, state) {
      final params = state.extra! as ItemModel;
      return ProductScreen(
        item: params,
      );
    },
  ),
  // GoRoute(
  //   path: testeRota,
  //   builder: (context, state) => const Page1(),
  // ),
  // GoRoute(
  //   path: '/page2',
  //   builder: (context, state) => const Page2(),
  // ),
  // GoRoute(
  //   path: '/page3',
  //   builder: (context, state) => const Page3(),
  // ),
]);
