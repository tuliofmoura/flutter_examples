import 'package:intl/intl.dart';

class FormatUtil {
  /// Clean up conversion; trim trailing zeros, e.g. 5.500 -> 5.5, 10.0 -> 10
  static String currencyBRLFormat(double value) {
    var f = new NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return f.format(value);
  }
}
