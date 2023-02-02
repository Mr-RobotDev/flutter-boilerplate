import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'signup_view.form.dart';
import 'signup_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'username',
    ),
    FormTextField(
      name: 'email',
    ),
    FormTextField(
      name: 'password',
    ),
  ],
)
class SignupView extends StackedView<SignupViewModel> with $SignupView {
  SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
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
                      'Sign Up',
                      style:
                          Theme.of(context).textTheme.headlineLarge!.copyWith(
                                fontWeight: FontWeight.w900,
                              ),
                    ),
                  ),
                  verticalSpaceMedium,
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(
                        FontAwesomeIcons.solidUser,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                    ),
                    enableSuggestions: false,
                    autocorrect: false,
                    keyboardType: TextInputType.name,
                    textInputAction: TextInputAction.next,
                    controller: usernameController,
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
                  verticalSpaceMedium,
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
                          icon: Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Icon(
                              FontAwesomeIcons.arrowRight,
                              color: Theme.of(context).colorScheme.onBackground,
                            ),
                          ),
                          onPressed: () {},
                          label: const Text('Sign Up'),
                        ),
                  verticalSpaceMedium,
                  TextButton(
                    onPressed: viewModel.navigateToLogin,
                    child: const Text('Already have an account? Login'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();

  @override
  void onViewModelReady(SignupViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(SignupViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
