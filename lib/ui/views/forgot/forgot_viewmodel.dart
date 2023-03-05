import 'package:boiler_plate/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ForgotViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();

  void navigateToLogin() {
    _navigationService.back();
  }
}
