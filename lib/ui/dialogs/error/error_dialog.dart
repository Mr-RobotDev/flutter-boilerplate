import 'package:flutter/material.dart';
import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

class ErrorDialog extends StatelessWidget {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ErrorDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
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
                onPressed: () => completer(DialogResponse(confirmed: true)),
                child: const Text(
                  'Got it',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
