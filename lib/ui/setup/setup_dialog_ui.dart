import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/enums/dialog_type.dart';
import 'package:boiler_plate/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:boiler_plate/ui/dialogs/error/error_dialog.dart';
import 'package:boiler_plate/ui/dialogs/notice/notice_dialog.dart';
import 'package:boiler_plate/ui/dialogs/warning/warning_dialog.dart';
import 'package:boiler_plate/ui/dialogs/success/success_dialog.dart';
// @stacked-import

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<dynamic, DialogBuilder> builders = {
    DialogType.infoAlert: (context, request, completer) =>
        InfoAlertDialog(request: request, completer: completer),
    DialogType.error: (context, request, completer) =>
        ErrorDialog(completer: completer, request: request),
    DialogType.notice: (context, request, completer) =>
        NoticeDialog(completer: completer, request: request),
    DialogType.warning: (context, request, completer) =>
        WarningDialog(completer: completer, request: request),
    DialogType.success: (context, request, completer) =>
        SuccessDialog(completer: completer, request: request),
// @stacked-dialog-builder
  };

  dialogService.registerCustomDialogBuilders(builders);
}
