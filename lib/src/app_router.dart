import 'package:app_greengrosser/src/models/item_models.dart';
import 'package:app_greengrosser/src/pages/auth/sigin_up_screen.dart';
import 'package:app_greengrosser/src/pages/auth/signin_screen.dart';
import 'package:app_greengrosser/src/pages/base/base_screen.dart';
import 'package:app_greengrosser/src/pages/product/product_screen.dart';
import 'package:go_router/go_router.dart';

const initialRoute = '/';
const signinUpRoute = '/signin_up';
const baseScreenRoute = '/base_screen';
const productScreenRoute = '/product_screen';

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
  GoRoute(
    path: productScreenRoute,
    builder: (_, state) {
      final params = state.extra! as ItemModel;
      return ProductScreen(
        item: params,
      );
    },
  ),
]);
