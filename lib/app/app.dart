import 'package:stacked/stacked_annotations.dart';
import 'package:boiler_plate/ui/views/home/home_view.dart';
import 'package:boiler_plate/ui/views/startup/startup_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:boiler_plate/services/authentication_service.dart';
import 'package:boiler_plate/ui/views/login/login_view.dart';
import 'package:boiler_plate/ui/views/signup/signup_view.dart';
import 'package:boiler_plate/ui/views/forgot/forgot_view.dart';
import 'package:boiler_plate/services/connectivity_service.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: StartupView),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: SignupView),
  MaterialRoute(page: ForgotView),
// @stacked-route
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: AuthenticationService),
  LazySingleton(classType: ConnectivityService),
// @stacked-service
])
class App {}
