class Ders {
  final String ad;
  final double harfDegeri;
  final double krediDegeri;

  Ders({required this.ad, required this.harfDegeri, required this.krediDegeri});


  @override
  String toString() {
    return "Ders Adı :"+ad+" Ders Harf Değeri :"+harfDegeri.toString() + " Ders Kredi Değeri :"+krediDegeri.toString();
  }
}



/*

** bunu listelerle daha rahat çalışabilmek adına yapıyoruz.



*/