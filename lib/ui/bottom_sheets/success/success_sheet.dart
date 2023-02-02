import 'package:flutter/material.dart';
import 'package:boiler_plate/ui/common/ui_helpers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked_services/stacked_services.dart';

class SuccessSheet extends StatelessWidget {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const SuccessSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                request.title ?? 'Hello Stacked Sheet!!',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Icon(
                FontAwesomeIcons.circleCheck,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          if (request.description != null) ...[
            verticalSpaceTiny,
            Text(
              request.description!,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 4,
              softWrap: true,
            ),
          ],
          verticalSpaceLarge,
        ],
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }
}
