import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
                child: const Icon(
                  FontAwesomeIcons.fingerprint,
                ),
              ),
              verticalSpaceLarge,
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
                textInputAction: TextInputAction.done,
                controller: emailController,
              ),
              verticalSpaceMedium,
              viewModel.isBusy
                  ? const MyCircularProgressIndicator()
                  : ElevatedButton(
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
                      onPressed: () {},
                      child: const Text('Reset Password'),
                    ),
              verticalSpaceMedium,
              TextButton(
                onPressed: viewModel.navigateToLogin,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.arrowLeft,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    horizontalSpaceSmall,
                    const Text(
                      'Back to Login',
                    ),
                  ],
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
}
