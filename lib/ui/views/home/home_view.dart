import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:boiler_plate/ui/dumb_widgets/my_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              verticalSpaceTiny,
              Builder(
                builder: (context) {
                  return MyAppBar(
                    leading: GestureDetector(
                      child: const Icon(
                        FontAwesomeIcons.bars,
                      ),
                      onTap: () {
                        Scaffold.of(context).openDrawer();
                      },
                    ),
                    title: 'Home',
                    trailing: GestureDetector(
                      child: const Icon(
                        FontAwesomeIcons.circleUser,
                      ),
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                    ),
                  );
                },
              ),
              verticalSpaceMedium,
              Center(
                child: Text(
                  'Connection Status: ${viewModel.connectionStatus}',
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

  // @override
  // void onViewModelReady(
  //   HomeViewModel viewModel,
  // ) {
  //   viewModel.updateConnectionStatus();
  // }
}
