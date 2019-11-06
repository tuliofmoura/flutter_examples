import 'package:intl/intl.dart';

class FormatUtil {
  ///Formats a double value into a BRL currency unit.
  static String currencyBRLFormat(double value) {
    var f = new NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
    return f.format(value);
  }
}
