import 'package:boiler_plate/app/app.locator.dart';
import 'package:boiler_plate/enums/dialog_type.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:boiler_plate/ui/dialogs/error/error_dialog.dart';
// @stacked-import

void setupDialogUi() {
  final dialogService = locator<DialogService>();

  final Map<dynamic, DialogBuilder> builders = {
    DialogType.error: (context, request, completer) =>
        ErrorDialog(completer: completer, request: request),
// @stacked-dialog-builder
  };

  dialogService.registerCustomDialogBuilders(builders);
}
