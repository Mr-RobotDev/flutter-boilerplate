import 'package:boiler_plate/ui/common/app_strings.dart';
import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'login_view.form.dart';
import 'login_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'email',
    ),
    FormTextField(
      name: 'password',
    ),
  ],
)
class LoginView extends StackedView<LoginViewModel> with $LoginView {
  LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Login',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                    ),
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidEnvelope,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(
                        FontAwesomeIcons.lock,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          viewModel.isPasswordVisible
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        onPressed: viewModel.togglePasswordVisibility,
                      ),
                    ),
                    obscureText: !viewModel.isPasswordVisible,
                    enableSuggestions: false,
                    autocorrect: false,
                    controller: passwordController,
                  ),
                  verticalSpaceSmall,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: () {},
                      label: const Text('Forgot Password?'),
                      icon: Icon(
                        FontAwesomeIcons.circleQuestion,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                  ),
                  verticalSpaceSmall,
                  viewModel.isBusy
                      ? const MyCircularProgressIndicator()
                      : ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(double.infinity, 64),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                bottomRight: Radius.circular(25),
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                          ),
                          onPressed: viewModel.login,
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          label: const Text('Login'),
                        ),
                  verticalSpaceMedium,
                  TextButton(
                    onPressed: viewModel.navigateToSignup,
                    child: const Text('Don\'t have an account? Sign Up'),
                  ),
                  verticalSpaceMedium,
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('OR'),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 64),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.google,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        label: const Text('Google'),
                      ),
                      horizontalSpaceMedium,
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(150, 64),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              topRight: Radius.circular(25),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        icon: Icon(
                          FontAwesomeIcons.facebook,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                        label: const Text('Facebook'),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(150, 64),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomRight: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      FontAwesomeIcons.apple,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    label: const Text('Apple'),
                  ),
                  verticalSpaceMedium,
                  viewModel.connectionStatus == ConnectivityResult.none
                      ? Container(
                          height: 40,
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            ksOfflineError,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onBackground,
                                ),
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.onPrimary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.initConnectivity();
    viewModel.connectivitySubscription = viewModel
        .connectivity.onConnectivityChanged
        .listen(viewModel.updateConnectionStatus);
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
    viewModel.connectivitySubscription.cancel();
  }
}
