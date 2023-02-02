import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/enums/bottom_sheet_type.dart';
import 'package:boiler_plate/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:boiler_plate/ui/bottom_sheets/alert/alert_sheet.dart';
import 'package:boiler_plate/ui/bottom_sheets/error/error_sheet.dart';
import 'package:boiler_plate/ui/bottom_sheets/warning/warning_sheet.dart';
import 'package:boiler_plate/ui/bottom_sheets/success/success_sheet.dart';
// @stacked-import

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final Map<dynamic, SheetBuilder> builders = {
    BottomSheetType.notice: (context, request, completer) =>
        NoticeSheet(completer: completer, request: request),
    BottomSheetType.alert: (context, request, completer) =>
        AlertSheet(completer: completer, request: request),
    BottomSheetType.error: (context, request, completer) =>
        ErrorSheet(completer: completer, request: request),
    BottomSheetType.warning: (context, request, completer) =>
        WarningSheet(completer: completer, request: request),
    BottomSheetType.success: (context, request, completer) =>
        SuccessSheet(completer: completer, request: request),
// @stacked-bottom-sheet-builder
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
