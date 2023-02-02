import 'package:boiler_plate/services/connection_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:stacked/stacked.dart';
import 'package:boiler_plate/app/app.locator.dart';

class HomeViewModel extends BaseViewModel {
  final _connectionService = locator<ConnectionService>();

  late ConnectivityResult _connectionStatus;

  ConnectivityResult get connectionStatus => _connectionStatus;

  HomeViewModel() {
    _connectionStatus = _connectionService.connectionStatus;
    _connectionService.connectivitySubscription
        .onData((ConnectivityResult result) {
      _connectionStatus = result;
      notifyListeners();
    });
  }
}