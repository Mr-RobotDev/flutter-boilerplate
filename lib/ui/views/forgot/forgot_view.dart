import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'forgot_view.form.dart';
import 'forgot_viewmodel.dart';

@FormView(
  fields: [
    FormTextField(
      name: 'email',
    ),
  ],
)
class ForgotView extends StackedView<ForgotViewModel> with $ForgotView {
  ForgotView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ForgotViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                padding: const EdgeInsets.all(16),
                child: const Icon(Icons.fingerprint),
              ),
              verticalSpaceMedium,
              Text(
                'Forgot Password',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              verticalSpaceMedium,
              Text(
                'No worries, we got you covered.',
                style: Theme.of(context).textTheme.bodyMedium,
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
                textInputAction: TextInputAction.done,
                controller: emailController,
              ),
              verticalSpaceMedium,
              viewModel.isBusy
                  ? const Center(
                      child: MyCircularProgressIndicator(),
                    )
                  : Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(128, 48),
                        ),
                        onPressed: () {},
                        child: const Text('Reset Password'),
                      ),
                    ),
              verticalSpaceMedium,
              Center(
                child: TextButton(
                  onPressed: viewModel.navigateToLogin,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.arrow_back_ios,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        'Back to Login',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  ForgotViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ForgotViewModel();

  @override
  void onViewModelReady(ForgotViewModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  void onDispose(ForgotViewModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }
}
