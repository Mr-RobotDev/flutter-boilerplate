import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              MyAppBar(
                leading: GestureDetector(
                  onTap: viewModel.logout,
                  child: const Icon(Icons.logout),
                ),
                title: 'Home',
              ),
              verticalSpaceLarge,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(128, 48),
                ),
                onPressed: viewModel.showBottomSheet,
                child: const Text('Show Bottom Sheet'),
              ),
              verticalSpaceLarge,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(128, 48),
                ),
                onPressed: viewModel.showSnackBar,
                child: const Text('Show SnackBar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();

  @override
  void onViewModelReady(HomeViewModel viewModel) {
    viewModel.checkConnection();
  }
}
