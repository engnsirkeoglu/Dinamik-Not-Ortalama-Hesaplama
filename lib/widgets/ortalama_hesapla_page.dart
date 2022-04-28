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
          return "Ders Adını Giriniz";
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

** AppBar'ımızın bir rengi olmadığı için buranın arka plan rengine transparent diyoruz.Bu da herhangi bir rengi olmaması adına bu rengi veriyoruz.

** AppBar'ımızın backgroundColor'ını biz transparent yaptık ama burada appBar'ın bir elevation değeri var bu elevation değerini gösterebilmek için appBar'ın
olduğu kısmı gri yapıyor biz bunu sıfır yaparsak appBar kaybolacaktır.Burada yazımız da gitti yani text de gitti aslında gitmedi orada ama yazı rengi beyaz 
olduğu için yazı görünmüyor.

** Şimdi biz burada textStyle vereceğiz ama Text'imizi bunu da bir paket yardımıyla yani yazımızın daha güzel görünmesi için bir google_fonts package'ini
indiriyoruz.

** Şimdi biz DropdownButton'ları direkt olarak kullanırsak çok fazla kişiselleştiremiyoruz.O yüzden DropdownButton'un çevresini Container ile sarmalayacağız.

** Şimdi biz _buildHarfNotu adlı metotu neden bir Widget içerinde yapmıyoruz bunu en son ders yapacağız çünkü neden ayrı ayrı Widget'lara bölüyoruz onu 
görmemiz için.

** Şimdi biz burada verileri tek tek yazdık ama biz metot içerisini böyle doldurmak istemiyoruz bunun yerine nasıl ki biz sabitler için bir klasör oluşturduk
aynı şekilde verilerimiz için de bir klasör oluşturabiliriz.Çünkü yarın öbür gün datalarımız veritabanından ya da başka bir yerden gelebilir bu nedenle
bu sınıf içerisini o datalarla doldurmak istemeyiz bunun için yeni bir klasör açıyoruz.

** DropdownButton'un elevation property'si Liste açıldığında z koordinatlarında hangi bölgeye açılacağıdır.

** Şimdi arayüzünü hazırladık arayüzlerden aldığımız değerleri yani kullanıcıdan aldığımız değerleri bir derse dönüştürüp bu dersleri de bu listede liste-
leyeceğiz.

** Bunun için de işlerimizi kolaylaştırması adına Ders adında bir class oluşturabiliriz bunları da yine model diye bir klasörün altında toplayalım...

** callback fonksiyonlarımızı oldukça fazla kullanıyoruz mantık olarak bu şekilde çalışıyor yani onElemanCikar gibi mantıkta çalışıyor.

** şimdi mesela ben herhangi bir not değeri değiştirdiğimde ya da kredi sayısını değiştirdiğimde OrtalamaHesapla Widget içerisindeki build metotu tetikleniyor ve 
bu da aslında değişmeyen yerlerin bile yeniden güncellenmesine sebeb oluyor ve performans kaybı oluyor bunun yerine mesela ben eğer harf notunu değiştiriyorsam
sadece orası güncellense ya da kredi sayısını değiştirdiğimde orası güncellense daha iyi bir performansta çalışabilir uygulamam.

** Bu nedenle de mümkün olduğunca farklı Widget'larla çalışmak önemli....

** biz burada farklı fonksiyonlara atadık sadece okunurluk arttı performans olarak hiç bir şey değişmedi.Ama ben burada harf notlarının olduğu kısmı kendi içerisinde
bir Widget yapsam burada değer değiştiğinde sadece o güncellense diğerleri değişmese olur mu olur

** ve bu öğrendiğimiz callback fonksiyon yapısını yani sınıfın kurucusuna bir fonksiyon atama işlemini kullanarak buradaki yapıyı bozmadan bunu yapabiliriz.

** 



*/
