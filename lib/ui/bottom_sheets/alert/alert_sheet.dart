import 'package:flutter/material.dart';
import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

class AlertSheet extends StatelessWidget {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const AlertSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (request.title != null) ...[
            verticalSpaceTiny,
            Text(
              request.title!,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description!,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 4,
              softWrap: true,
            ),
          ],
          verticalSpaceMedium,
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(128, 48),
              ),
              onPressed: () => completer!(
                SheetResponse(confirmed: true),
              ),
              child: const Text(
                'Got it',
              ),
            ),
          ),
          verticalSpaceMedium,
        ],
      ),
    );
  }
}
