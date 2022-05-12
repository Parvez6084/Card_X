import 'package:card_x/middleware/service_middleware.dart';
import 'package:card_x/routes/app_routes.dart';
import 'package:card_x/views/pages/cardList_page/cardListPage.dart';
import 'package:card_x/views/pages/category_page/categoryPage.dart';
import 'package:card_x/views/pages/dashboard_page/dashboardPage.dart';
import 'package:card_x/views/pages/details_page/detailsPage.dart';
import 'package:card_x/views/pages/favorite_page/favoritePage.dart';
import 'package:card_x/views/pages/home_page/homePage.dart';
import 'package:card_x/views/pages/scan_page/scanPage.dart';
import 'package:card_x/views/pages/welcome_page/welcomePage.dart';
import 'package:card_x/views/pages/welcome_page/welcomePageBinding.dart';
import 'package:get/get.dart';

import '../views/pages/addCard_page/addCardPage.dart';
import '../views/pages/addCard_page/addCardPageBinding.dart';
import '../views/pages/cardList_page/cardListPageBinding.dart';
import '../views/pages/category_page/addCategoryPage.dart';
import '../views/pages/category_page/categoryPageBinding.dart';
import '../views/pages/dashboard_page/dashboardPageBinding.dart';
import '../views/pages/detailsEdit_page/detailsEditPage.dart';
import '../views/pages/detailsEdit_page/detailsEditPageBinding.dart';
import '../views/pages/details_page/detailsPageBinding.dart';
import '../views/pages/search_page/searchPage.dart';
import '../views/pages/search_page/searchPageBinding.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.dashBoardPage;
  static final routes = [
    GetPage(
      name: Routes.welcomePage,
      page: () => WelcomePage(),
      binding: WelcomePageBinding(),
    ),
    GetPage(
        name: Routes.dashBoardPage,
        page: () => DashBoardPage(),
        binding: DashBoardPageBinding(),
        middlewares: [ServiceMiddleware()]),
    GetPage(
      name: Routes.homePage,
      page: () => HomePage(),
      binding: DashBoardPageBinding(),
    ),
    GetPage(
      name: Routes.scanPage,
      page: () => ScanPage(),
      binding: DashBoardPageBinding(),
    ),
    GetPage(
      name: Routes.favoritePage,
      page: () => FavoritePage(),
      binding: DashBoardPageBinding(),
    ),
    GetPage(
      name: Routes.categoryPage,
      page: () => CategoryPage(),
      binding: CategoryPageBinding(),
    ),
    GetPage(
      name: Routes.cardListPage,
      page: () => CardListPage(),
      binding: CardListPageBinding(),
    ),
    GetPage(
      name: Routes.searchPage,
      page: () => SearchPage(),
      binding: SearchPageBinding(),
    ),
    GetPage(
      name: Routes.detailsPage,
      page: () => DetailsPage(),
      binding: DetailsPageBinding(),
    ),
    GetPage(
      name: Routes.detailsEditPage,
      page: () => DetailsEditPage(),
      binding: DetailsEditPageBinding(),
    ),
    GetPage(
      name: Routes.addCardPage,
      page: () => AddCardPage(),
      binding: AddCardPageBinding(),
    ),
    GetPage(
      name: Routes.addCategoryPage,
      page: () => AddCategoryPage(),
      binding: CategoryPageBinding(),
    ),
  ];
}
