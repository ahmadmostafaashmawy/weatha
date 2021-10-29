import 'package:flutter/cupertino.dart';

import 'localization/app_localizations.dart';

String validatorStringRequired(value, BuildContext context) {
  String pattern = r'^[0-9]{10,15}$';
  RegExp regExp = RegExp(pattern);

  if (value == null || value.isEmpty) {
    return AppLocalizations.of(context).translate('Required');
  } else if (regExp.hasMatch(value)) {
    return AppLocalizations.of(context)
        .translate('Please enter a valid city name');
  }
  return null;
}
