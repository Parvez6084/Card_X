import 'package:card_x/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ServiceMiddleware extends GetMiddleware {
  @override
  int? get priority => 2;

  bool isContractEmpty = true;

  @override
  RouteSettings? redirect(String? route) {
    if (isContractEmpty == false)
      return RouteSettings(name: Routes.welcomePage);
  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    // TODO: implement onPageCalled
    return super.onPageCalled(page);
  }

  @override
  List<Bindings>? onBindingsStart(List<Bindings>? bindings) {
    // TODO: implement onBindingsStart
    return super.onBindingsStart(bindings);
  }

  @override
  GetPageBuilder? onPageBuildStart(GetPageBuilder? page) {
    // TODO: implement onPageBuildStart
    return super.onPageBuildStart(page);
  }

  @override
  Widget onPageBuilt(Widget page) {
    // TODO: implement onPageBuilt
    return super.onPageBuilt(page);
  }

  @override
  void onPageDispose() {
    // TODO: implement onPageDispose
    super.onPageDispose();
  }
}
