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
                  child: const Icon(Icons.logout),
                  onTap: viewModel.logout,
                ),
                title: 'Home',
                trailing: GestureDetector(
                  child: const Icon(
                    Icons.more_vert,
                  ),
                  onTap: viewModel.showBottomSheet,
                ),
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
}
