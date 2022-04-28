import 'package:dinamik_not_ortalama_hesaplama_proje/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/helper/data_helper.dart';
import 'package:flutter/material.dart';

class HarfDropdownButtonWidget extends StatefulWidget {
  final Function onHarfSecildi;
  double? harfNotu = 4;
  HarfDropdownButtonWidget({required this.onHarfSecildi, Key? key})
      : super(key: key);

  @override
  State<HarfDropdownButtonWidget> createState() =>
      _HarfDropdownButtonWidgetState();
}

class _HarfDropdownButtonWidgetState extends State<HarfDropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDownButtonPadding,
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius,
      ),
      child: DropdownButton<double>(
        value: widget.harfNotu,
        items: DataHelper.tumDerslerinHarfleri(),
        onChanged: (deger) {
          setState(() {
            widget.harfNotu = deger;
            widget.onHarfSecildi(widget.harfNotu);
          });
        },
        underline: Container(),
        iconEnabledColor: Sabitler.anaRenk.shade300,
        elevation: 20,
      ),
    );
  }
}



/*

** biz buradan hangi değerin seçildiğini OrtalamaHesapla Widget'ına gönderebilmek için callback bir fonksiyon yazmamız gerekiyor aksi takdirde burada ne seçildiği 
bilgisi oraya gitmeyecektir.Bu da ne seçildiğinin bir önemi olmayacağı anlamına gelir.

** peki ben bu callback fonksiyonu tam olarak nerede çağıracağım bir diğer önemli nokta da bu kısım bunu da aslında DropdownButton'un onChanged callback 
fonksiyonu içerisinde yapacağım çünkü değer burada değişiyor bu değeri bekleyen yerlere de bu Widget'ın değiştiği bilgisini göndermemiz gerekiyor.



*/