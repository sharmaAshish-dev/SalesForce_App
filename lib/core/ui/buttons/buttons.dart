library buttons;

import 'package:flutter/Material.dart';
import 'package:sales_force/core/ui/decorators/decorators.dart';

import '../../../values/values.dart';

part 'primary_button.dart';

part 'secondary_button.dart';

class _Button extends StatelessWidget {
  final String text;
  final Function()? onPressed;
  final bool isPrimary;

  const _Button({Key? key, required this.text, this.onPressed, this.isPrimary = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: isPrimary ? Theme.of(context).primaryColor : null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius), side: BorderSide(color: Theme.of(context).primaryColor)),
      padding: const EdgeInsets.symmetric(horizontal: Sizes.PADDING_32, vertical: Sizes.PADDING_16),
      elevation: Sizes.ELEVATION_4,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: isPrimary ? Theme.of(context).primaryColor.computeLuminance() > 0.5 ? black : white : Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
