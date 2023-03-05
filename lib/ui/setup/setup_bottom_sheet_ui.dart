import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/enums/bottom_sheet_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:boiler_plate/ui/bottom_sheets/alert/alert_sheet.dart';
// @stacked-import

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final Map<dynamic, SheetBuilder> builders = {
    BottomSheetType.alert: (context, request, completer) =>
        AlertSheet(completer: completer, request: request),
// @stacked-bottom-sheet-builder
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
