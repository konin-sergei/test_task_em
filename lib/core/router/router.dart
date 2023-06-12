import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:test_task_em/core/theme.dart';
import 'package:test_task_em/features/cart/cart_page.dart';
import 'package:test_task_em/features/categories/categories_page.dart';
import 'package:test_task_em/features/category/category_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorCategoriesKey = GlobalKey<NavigatorState>(debugLabel: 'shellCategories');
final _shellNavigatorSearchKey = GlobalKey<NavigatorState>(debugLabel: 'shellSearch');
final _shellNavigatorCartKey = GlobalKey<NavigatorState>(debugLabel: 'shellCart');
final _shellNavigatorProfileKey = GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

final goRouter = GoRouter(
  initialLocation: '/categories',
  navigatorKey: _rootNavigatorKey,
  debugLogDiagnostics: true,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithBottomNavBar(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCategoriesKey,
          routes: [
            GoRoute(
              path: '/categories',
              pageBuilder: (context, state) => const NoTransitionPage(
                child: CategoriesPage(),
              ),
              routes: [
                GoRoute(
                  path: 'category/:nameCategory',
                  builder: (context, state) => CategoryPage(nameCategory: state.pathParameters['nameCategory'] ?? ''),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSearchKey,
          routes: [
            GoRoute(
              path: '/search',
              builder: (context, state) => const CategoriesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCartKey,
          routes: [
            GoRoute(
              path: '/cart',
              builder: (context, state) => const CartPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorProfileKey,
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) => const CategoriesPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);

class ScaffoldWithBottomNavBar extends StatelessWidget {
  const ScaffoldWithBottomNavBar({Key? key, required this.navigationShell}) : super(key: key ?? const ValueKey<String>('ScaffoldWithBottomNavBar'));
  final StatefulNavigationShell navigationShell;

  void _tap(BuildContext context, int index) {
    // Pass Search and Profile
    if (index == 1 || index == 3) {
      return;
    }
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    double iconPadding = 4.0;
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_home.svg", colorFilter: const ColorFilter.mode(bottomNavigationBarUnSelectColor, BlendMode.srcIn)),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_home.svg", colorFilter: const ColorFilter.mode(accentColor, BlendMode.srcIn)),
            ),
            label: 'Меню',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_search.svg", colorFilter: const ColorFilter.mode(bottomNavigationBarUnSelectColor, BlendMode.srcIn)),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_search.svg", colorFilter: const ColorFilter.mode(accentColor, BlendMode.srcIn)),
            ),
            label: 'Поиск',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_bag.svg", colorFilter: const ColorFilter.mode(bottomNavigationBarUnSelectColor, BlendMode.srcIn)),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_bag.svg", colorFilter: const ColorFilter.mode(accentColor, BlendMode.srcIn)),
            ),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_profile.svg", colorFilter: const ColorFilter.mode(bottomNavigationBarUnSelectColor, BlendMode.srcIn)),
            ),
            activeIcon: Padding(
              padding: EdgeInsets.symmetric(vertical: iconPadding),
              child: SvgPicture.asset("assets/icons/menu_profile.svg", colorFilter: const ColorFilter.mode(accentColor, BlendMode.srcIn)),
            ),
            label: 'Аккаунт',
          ),
        ],
        selectedLabelStyle: const TextStyle(
          fontFamily: 'San Francisco Pro Display',
        ),
        unselectedLabelStyle: const TextStyle(
          fontFamily: 'San Francisco Pro Display',
        ),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _tap(context, index),
      ),
    );
  }
}
