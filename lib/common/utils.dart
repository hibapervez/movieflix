import 'package:intl/intl.dart';

class Utils {
  static String formatDate(String date) {
    DateTime tempDate = DateFormat("yyyy-MM-dd").parse(date);
    return DateFormat("MMMM dd, yyyy").format(tempDate);
  }
}