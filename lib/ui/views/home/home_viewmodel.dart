import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/enums/bottom_sheet_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _bottomSheetService = locator<BottomSheetService>();

  Future<void> showBottomSheet() async {
    await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.alert,
      title: 'Bottom Sheet',
      description: 'This is custom bottom sheet',
    );
  }
}
