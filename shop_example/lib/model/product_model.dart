import 'package:flutter/material.dart';

/// A [ProductModel] model.
class ProductModel {
  final String name;
  final double value;
  final ColorSwatch color;
  final IconData iconLocation;

  /// A [ProductModel] stores its name, value, icon and color
  const ProductModel(
      {@required this.name,
      @required this.value,
      @required this.color,
      @required this.iconLocation})
      : assert(name != null),
        assert(value != null),
        assert(color != null),
        assert(iconLocation != null);

  static List<ProductModel> get stockList {
    return [
      ProductModel(
        name: 'Piece of cake',
        value: 6.90,
        color: ColorSwatch(0xFFFF9914,
            {'iconColor': Color(0xFFFF9914), 'splash': Color(0x22FF9914)}),
        iconLocation: Icons.cake,
      ),
      ProductModel(
        name: 'Mr. Robot',
        value: 999.99,
        color: ColorSwatch(0xFF51B210,
            {'iconColor': Color(0xFF51B210), 'splash': Color(0x2251B210)}),
        iconLocation: Icons.android,
      ),
      ProductModel(
        name: 'Guarda-sol',
        value: 42,
        color: ColorSwatch(0xFF08BDBD,
            {'iconColor': Color(0xFF08BDBD), 'splash': Color(0x2208BDBD)}),
        iconLocation: Icons.beach_access,
      ),
      ProductModel(
        name: 'Câmera',
        value: 678.90,
        color: ColorSwatch(0xFF5B5B5B,
            {'iconColor': Color(0xFF5B5B5B), 'splash': Color(0x225B5B5B)}),
        iconLocation: Icons.camera_alt,
      ),
      ProductModel(
        name: 'Nuvem voadora',
        value: 9000.01,
        color: ColorSwatch(0xFFEFCF00,
            {'iconColor': Color(0xFFEFCF00), 'splash': Color(0x22EFCF00)}),
        iconLocation: Icons.cloud,
      ),
      ProductModel(
        name: 'WiFi grátis',
        value: 0.0,
        color: ColorSwatch(0xFF7B5EB5,
            {'iconColor': Color(0xFF7B5EB5), 'splash': Color(0x227B5EB5)}),
        iconLocation: Icons.wifi,
      ),
      ProductModel(
        name: 'Felicidade',
        value: 10000000,
        color: ColorSwatch(0xFF014892,
            {'iconColor': Color(0xFF014892), 'splash': Color(0x22014892)}),
        iconLocation: Icons.insert_emoticon,
      ),
      ProductModel(
        name: 'Bugzim',
        value: 0.01,
        color: ColorSwatch(0xFFF21B3F,
            {'iconColor': Color(0xFFF21B3F), 'splash': Color(0x22F21B3F)}),
        iconLocation: Icons.bug_report,
      ),
    ];
  }

  bool operator ==(o) =>
      o is ProductModel && o.name == name && o.value == value;

  int get hashCode => name.hashCode ^ value.hashCode;
}
