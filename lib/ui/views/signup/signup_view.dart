import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
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
                    decoration: const InputDecoration(
                      hintText: 'Username',
                      prefixIcon: Icon(
                        Icons.person,
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
                    decoration: const InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(
                        Icons.email,
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
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(viewModel.isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
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
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(128, 48),
                          ),
                          onPressed: () {},
                          child: const Text('Sign Up'),
                        ),
                  verticalSpaceMedium,
                  TextButton(
                    onPressed: viewModel.navigateToLogin,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(
                          Icons.arrow_back_ios,
                        ),
                        horizontalSpaceSmall,
                        Text('Already have an account? Login'),
                      ],
                    ),
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
