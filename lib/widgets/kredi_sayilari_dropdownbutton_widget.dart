import 'package:dinamik_not_ortalama_hesaplama_proje/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/helper/data_helper.dart';
import 'package:flutter/material.dart';

class KrediSayilariDropdownButtonWidget extends StatefulWidget {
  double? krediSayisi = 1;
  final Function onKrediSayisiDegistir;
  KrediSayilariDropdownButtonWidget(
      {required this.onKrediSayisiDegistir(double krediSayisi), Key? key})
      : super(key: key);

  @override
  State<KrediSayilariDropdownButtonWidget> createState() =>
      _KrediSayilariDropdownButtonWidgetState();
}

class _KrediSayilariDropdownButtonWidgetState
    extends State<KrediSayilariDropdownButtonWidget> {
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
        value: widget.krediSayisi,
        items: DataHelper.derslerinKrediSayilari(),
        onChanged: (deger) {
          setState(() {
            widget.krediSayisi = deger;
            widget.onKrediSayisiDegistir(widget.krediSayisi);
          });
        },
        underline: Container(),
        iconEnabledColor: Sabitler.anaRenk.shade300,
        elevation: 20,
      ),
    );
  }
}
