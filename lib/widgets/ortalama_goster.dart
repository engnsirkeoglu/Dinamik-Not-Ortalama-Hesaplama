import 'package:dinamik_not_ortalama_hesaplama_proje/constants/app_constants.dart';
import 'package:flutter/material.dart';

class OrtalamaGoster extends StatelessWidget {
  final double ortalama;
  final int dersSayisi;
  const OrtalamaGoster(
      {required this.ortalama, required this.dersSayisi, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          dersSayisi > 0 ? "$dersSayisi Ders Seçildi" : "Ders Seçiniz",
          style: Sabitler.ortalamaGosterTextStyle,
        ),
        Text(
          ortalama >= 0 ? "${ortalama.toStringAsFixed(2)}" : "0.0",
          style: Sabitler.ortalamaTextStyle,
        ),
        Text(
          "Ortalama",
          style: Sabitler.ortalamaGosterTextStyle,
        ),
      ],
    );
  }
}
