import 'package:flutter_clean_architecture/core/extensions/date_time_extension.dart';

extension StringDateTimeExtension on String {
  String formatedToBrazilianTime() {
    if (isEmpty) '';

    DateTime? dateTime = DateTime.tryParse(this);

    if (dateTime != null) {
      return dateTime.brazilianDateTime;
    } else {
      return this;
    }
  }
}
