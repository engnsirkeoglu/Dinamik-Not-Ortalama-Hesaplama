import 'package:dinamik_not_ortalama_hesaplama_proje/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/model/ders.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/widgets/ders_listesi.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/widgets/harf_dropdownbutton_widget.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/widgets/kredi_sayilari_dropdownbutton_widget.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/widgets/ortalama_goster.dart';
import 'package:flutter/material.dart';

class OrtalamaHesaplaPage extends StatefulWidget {
  OrtalamaHesaplaPage({Key? key}) : super(key: key);

  @override
  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? harfNotu = 4;
  double? krediSayisi = 1;
  String? girilenDersAdi = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(
            Sabitler.appBarTitleText,
            style: Sabitler.appBarTitleTextStyle,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: _buildForm(),
              ),
              Expanded(
                flex: 1,
                child: OrtalamaGoster(
                  ortalama: DataHelper.ortalamaHesapla(),
                  dersSayisi: DataHelper.tumEklenenDersler.length,
                ),
              ),
            ],
          ),
          Expanded(
            child: DersListesi(
              onElemanCikar: (int index) {
                DataHelper.tumEklenenDersler.removeAt(index);
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: formKey,
      child: Column(
        children: [
          Padding(
            padding: Sabitler.yatayPadding8,
            child: _buildTextFormField(),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: HarfDropdownButtonWidget(
                    onHarfSecildi: (secilenHarfNotu) {
                      harfNotu = secilenHarfNotu;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: Sabitler.yatayPadding8,
                  child: KrediSayilariDropdownButtonWidget(
                      onKrediSayisiDegistir: (secilenKrediSayisi) {
                    krediSayisi = secilenKrediSayisi;
                  }),
                ),
              ),
              IconButton(
                onPressed: dersEkleVeOrtalamaHesapla,
                icon: Icon(
                  Icons.arrow_forward_ios_sharp,
                  color: Sabitler.anaRenk,
                  size: 30,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius,
          borderSide: BorderSide.none,
        ),
        hintText: "Matematik",
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.2),
        filled: true,
      ),
      onSaved: (deger) {
        setState(() {
          girilenDersAdi = deger!;
        });
      },
      validator: (value) {
        if (value!.length <= 0) {
          return "Ders Ad??n?? Giriniz";
        } else {
          return null;
        }
      },
    );
  }

  dersEkleVeOrtalamaHesapla() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var eklenecekDers = Ders(
        ad: girilenDersAdi!,
        harfDegeri: harfNotu!,
        krediDegeri: krediSayisi!,
      );
      DataHelper.dersEkle(eklenecekDers);
      setState(() {});
    }
  }
}


/*

** AppBar'??m??z??n bir rengi olmad?????? i??in buran??n arka plan rengine transparent diyoruz.Bu da herhangi bir rengi olmamas?? ad??na bu rengi veriyoruz.

** AppBar'??m??z??n backgroundColor'??n?? biz transparent yapt??k ama burada appBar'??n bir elevation de??eri var bu elevation de??erini g??sterebilmek i??in appBar'??n
oldu??u k??sm?? gri yap??yor biz bunu s??f??r yaparsak appBar kaybolacakt??r.Burada yaz??m??z da gitti yani text de gitti asl??nda gitmedi orada ama yaz?? rengi beyaz 
oldu??u i??in yaz?? g??r??nm??yor.

** ??imdi biz burada textStyle verece??iz ama Text'imizi bunu da bir paket yard??m??yla yani yaz??m??z??n daha g??zel g??r??nmesi i??in bir google_fonts package'ini
indiriyoruz.

** ??imdi biz DropdownButton'lar?? direkt olarak kullan??rsak ??ok fazla ki??iselle??tiremiyoruz.O y??zden DropdownButton'un ??evresini Container ile sarmalayaca????z.

** ??imdi biz _buildHarfNotu adl?? metotu neden bir Widget i??erinde yapm??yoruz bunu en son ders yapaca????z ????nk?? neden ayr?? ayr?? Widget'lara b??l??yoruz onu 
g??rmemiz i??in.

** ??imdi biz burada verileri tek tek yazd??k ama biz metot i??erisini b??yle doldurmak istemiyoruz bunun yerine nas??l ki biz sabitler i??in bir klas??r olu??turduk
ayn?? ??ekilde verilerimiz i??in de bir klas??r olu??turabiliriz.????nk?? yar??n ??b??r g??n datalar??m??z veritaban??ndan ya da ba??ka bir yerden gelebilir bu nedenle
bu s??n??f i??erisini o datalarla doldurmak istemeyiz bunun i??in yeni bir klas??r a????yoruz.

** DropdownButton'un elevation property'si Liste a????ld??????nda z koordinatlar??nda hangi b??lgeye a????laca????d??r.

** ??imdi aray??z??n?? haz??rlad??k aray??zlerden ald??????m??z de??erleri yani kullan??c??dan ald??????m??z de??erleri bir derse d??n????t??r??p bu dersleri de bu listede liste-
leyece??iz.

** Bunun i??in de i??lerimizi kolayla??t??rmas?? ad??na Ders ad??nda bir class olu??turabiliriz bunlar?? da yine model diye bir klas??r??n alt??nda toplayal??m...

** callback fonksiyonlar??m??z?? olduk??a fazla kullan??yoruz mant??k olarak bu ??ekilde ??al??????yor yani onElemanCikar gibi mant??kta ??al??????yor.

** ??imdi mesela ben herhangi bir not de??eri de??i??tirdi??imde ya da kredi say??s??n?? de??i??tirdi??imde OrtalamaHesapla Widget i??erisindeki build metotu tetikleniyor ve 
bu da asl??nda de??i??meyen yerlerin bile yeniden g??ncellenmesine sebeb oluyor ve performans kayb?? oluyor bunun yerine mesela ben e??er harf notunu de??i??tiriyorsam
sadece oras?? g??ncellense ya da kredi say??s??n?? de??i??tirdi??imde oras?? g??ncellense daha iyi bir performansta ??al????abilir uygulamam.

** Bu nedenle de m??mk??n oldu??unca farkl?? Widget'larla ??al????mak ??nemli....

** biz burada farkl?? fonksiyonlara atad??k sadece okunurluk artt?? performans olarak hi?? bir ??ey de??i??medi.Ama ben burada harf notlar??n??n oldu??u k??sm?? kendi i??erisinde
bir Widget yapsam burada de??er de??i??ti??inde sadece o g??ncellense di??erleri de??i??mese olur mu olur

** ve bu ????rendi??imiz callback fonksiyon yap??s??n?? yani s??n??f??n kurucusuna bir fonksiyon atama i??lemini kullanarak buradaki yap??y?? bozmadan bunu yapabiliriz.

** 



*/
