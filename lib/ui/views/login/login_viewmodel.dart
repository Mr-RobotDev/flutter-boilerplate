import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/app/app.router.dart';
import 'package:boiler_plate/enums/dialog_type.dart';
import 'package:boiler_plate/services/authentication_service.dart';
import 'package:boiler_plate/services/connectivity_service.dart';
import 'package:boiler_plate/ui/common/app_strings.dart';
import 'package:boiler_plate/ui/views/signup/signup_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends FormViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _authenticationService = locator<AuthenticationService>();
  final _connectivityService = locator<ConnectivityService>();

  bool _isOnline = true;
  bool _isPasswordVisible = false;

  bool get isOnline => _isOnline;
  bool get isPasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void checkConnection() async {
    _isOnline = await _connectivityService.checkConnection;
    notifyListeners();
    _connectivityService.isConnected.listen((event) {
      _isOnline = event;
      notifyListeners();
    });
  }

  void login() async {
    if (emailValue == null || emailValue!.isEmpty) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: ksEmailInvalidErrorTitle,
        description: ksEmailEmptyError,
      );
      return;
    }

    if (!emailRegex.hasMatch(emailValue!)) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: ksEmailInvalidErrorTitle,
        description: ksEmailInvalidError,
      );
      return;
    }

    if (passwordValue == null || passwordValue!.isEmpty) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: ksPasswordInvalidErrorTitle,
        description: ksPasswordEmptyError,
      );
      return;
    }

    if (!passwordRegex.hasMatch(passwordValue!)) {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: ksPasswordInvalidErrorTitle,
        description: ksPasswordInvalidError,
      );
      return;
    }

    final isLoggedIn = await runBusyFuture(
      _authenticationService.login(
        emailValue!,
        passwordValue!,
      ),
    );

    if (isLoggedIn) {
      _navigationService.replaceWithHomeView();
    } else {
      await _dialogService.showCustomDialog(
        variant: DialogType.error,
        title: 'Login Failed',
        description: 'Please check your credentials and try again',
      );
    }
  }

  void navigateToSignup() {
    _navigationService.navigateToSignupView();
  }

  void navigateToForgotPassword() {
    _navigationService.navigateToForgotView();
  }
}
