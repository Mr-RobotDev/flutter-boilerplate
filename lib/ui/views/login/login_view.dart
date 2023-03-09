import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
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
                        icon: Icon(
                          viewModel.isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
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
                    child: TextButton(
                      onPressed: viewModel.navigateToForgotPassword,
                      child: const Text('Forgot Password?'),
                    ),
                  ),
                  verticalSpaceSmall,
                  viewModel.isBusy
                      ? const MyCircularProgressIndicator()
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(128, 48),
                          ),
                          onPressed: viewModel.login,
                          child: const Text('Login'),
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
                          minimumSize: const Size(128, 48),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.g_translate,
                        ),
                        label: const Text('Google'),
                      ),
                      horizontalSpaceMedium,
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(128, 48),
                        ),
                        onPressed: () {},
                        icon: const Icon(
                          Icons.facebook,
                        ),
                        label: const Text('Facebook'),
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(128, 48),
                    ),
                    onPressed: () {},
                    icon: const Icon(
                      Icons.phone,
                    ),
                    label: const Text('Apple'),
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
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    syncFormWithViewModel(viewModel);
    viewModel.checkConnection();
  }

  @override
  void onDispose(LoginViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
