import 'package:intl/intl.dart';

class FormatDate {
  static String format(String date) {
    return DateFormat.yMMMEd().format(DateTime.tryParse(date));
  }
}
