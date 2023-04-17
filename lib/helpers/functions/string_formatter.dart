import 'package:intl/intl.dart';

class StringFormatter {
  String removeDecimalZeroFormat(double v) {
    NumberFormat formatter = NumberFormat();
    formatter.minimumFractionDigits = 0;
    formatter.maximumFractionDigits = 2;
    return formatter.format(v);
  }

  String dateFormatter(DateTime s) {
    try {
      final formatter = DateFormat('MMMM dd, yyyy');
      return formatter.format(s);
    } catch (e) {
      return "-";
    }
  }

  String metaCriticFormatter(String s) {
    try {
      if (s.contains("null")) {
        s = "-";
      }
      return s;
    } catch (e) {
      return "-";
    }
  }
}
