import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityService {
  StreamController<ConnectivityResult> controller =
      StreamController<ConnectivityResult>.broadcast();

  ConnectivityService() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      controller.add(result);
    });
  }

  Stream<bool> get isConnected async* {
    yield* controller.stream.map((ConnectivityResult result) {
      return result != ConnectivityResult.none;
    });
  }
  
  Future<bool> get checkConnection async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
