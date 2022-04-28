import 'package:dinamik_not_ortalama_hesaplama_proje/model/ders.dart';
import 'package:flutter/material.dart';

class DataHelper {
  static List<Ders> tumEklenenDersler = [];

  static double ortalamaHesapla() {
    double toplamNot = 0;
    double toplamKredi = 0;

    tumEklenenDersler.forEach((element) {
      toplamNot += element.harfDegeri * element.krediDegeri;
      toplamKredi += element.krediDegeri;
    });

    return toplamNot / toplamKredi;
  }

  static dersEkle(Ders eklenecekDers) {
    tumEklenenDersler.add(eklenecekDers);
  }

  static List<String> _derslerinHarfNotlari() {
    return ["AA", "BA", "BB", "CB", "CC", "DC", "DD", "FD", "FF"];
  }

  static double _harfiNotaCevir(String harf) {
    switch (harf) {
      case "AA":
        return 4;
      case "BA":
        return 3.5;
      case "BB":
        return 3.0;
      case "CB":
        return 2.5;
      case "CC":
        return 2.0;
      case "DC":
        return 1.5;
      case "DD":
        return 1.0;
      case "FD":
        return 0.5;
      case "FF":
        return 0.0;
      default:
        return 1.0;
    }
  }

  static List<DropdownMenuItem<double>> tumDerslerinHarfleri() {
    return _derslerinHarfNotlari()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e),
            value: _harfiNotaCevir(e),
          ),
        )
        .toList();
  }

  static List<int> _krediSayisi() {
    return List.generate(10, (index) => index + 1);
  }

  static List<DropdownMenuItem<double>> derslerinKrediSayilari() {
    return _krediSayisi()
        .map(
          (e) => DropdownMenuItem(
            child: Text(e.toString()),
            value: e.toDouble(),
          ),
        )
        .toList();
  }
}
