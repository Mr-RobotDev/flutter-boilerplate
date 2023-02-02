import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionService {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> connectivitySubscription;

  ConnectionService() {
    connectivitySubscription =
        connectivity.onConnectivityChanged.listen(updateConnectionStatus);
  }

  void updateConnectionStatus(ConnectivityResult result) {
    connectionStatus = result;
  }

  void dispose() {
    connectivitySubscription.cancel();
  }
}
