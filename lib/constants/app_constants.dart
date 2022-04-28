import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const materialAppTitle = "Dinamik Ortalama Hesaplama";
  static const anaRenk = Colors.indigo;
  static const appBarTitleText = "Ortalama Hesaplama";
  static final TextStyle appBarTitleTextStyle = GoogleFonts.quicksand(
    fontSize: 24,
    color: anaRenk,
    fontWeight: FontWeight.w900,
  );
  static final borderRadius = BorderRadius.circular(16.0);

  static final TextStyle ortalamaGosterTextStyle = GoogleFonts.quicksand(
    fontSize: 16,
    color: anaRenk,
    fontWeight: FontWeight.w600,
  );
  static final TextStyle ortalamaTextStyle = GoogleFonts.quicksand(
    fontSize: 55,
    color: anaRenk,
    fontWeight: FontWeight.w800,
  );
  static final dropDownButtonPadding = EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  );

  static final yatayPadding8 = EdgeInsets.symmetric(horizontal: 8);
}


/*

** Bu sınıf içerisinde uygulamam içerisinde kullanacağım sabit değerler yer alacak...

** Şimdi ben bu sınıf üzerinden herhangi bir nesne üretmeden bunları çağırıp kullanabilmek için değişkenlerimizi static tanımlıyoruz...

** google_fonst package'ını indirdik ve buraya import ettik burada textStyle'a bir değer atacağız GoogleFonst bize bir textStyle döndürüyor.

** şimdi burada neden const demedik const'lar derleme aşamasında sabitleri oluşturuyor ama GoogleFont'lar runtime da oluşacağı için const işe yaramıyor
o nedenle de burada final kullanıyoruz.


*/