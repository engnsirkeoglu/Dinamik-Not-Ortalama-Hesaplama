import 'package:dinamik_not_ortalama_hesaplama_proje/widgets/ortalama_hesapla_page.dart';
import 'package:flutter/material.dart';
import 'constants/app_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Sabitler.materialAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Sabitler.anaRenk,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}



/*

** Şimdi MaterialApp ile başladık....

** MaterialApp içerisinde title property'si ile başlayalım title neydi uygulamayı sekmeler kısmına aldığımızda görünecek olan isimdi.Buraya Dinamik Ortalama
Hesapla diye uygulamamızın ismini yazdık.

** Daha sonra uygulamamızın temasını belirtebeliriz.....Bunun için de theme property'sini kullanıyoruz. ThemeData içerisinde primarySwatch uygulamanın her yerine
aynı rengi veriyor bu nedenle bunu tercih ettik şimdi biz bunun rengini burada verebiliriz yani ben burada primarySwatch property'sine Colors. diyip bir renk
ataması yapabilirim ama ben bu sabit değerlerimi sabit bir çatı altında toplayayım ki benim uygulamam büyüdüğünde ben bu sabit değerleri değiştireceğim
ya da güncelleyeceğim zaman buradan hemen direkt olarak müdahale edebileyim.Peki bu sabit değerler nelerdir ?  => Özellikle renkler,textler,marginler,
textStyle'ler bunları ayrı bir dosyada ele alırsak bizim için daha iyi olur.

** içerisinde sadece sabitlerin olacağı constants diye bir klasör oluşturalım ve buraya istersek renkleri başka bir dosyaya alabiliriz,textStyle'leri farklı
bir dosyaya alabiliriz.Ama bu çok büyük uygulamalar için geçerli şeyler bu nedenle biz bunları işte renkleri textleri,marginleri,textStyle vb şeyleri tek bir
dosya oluşturarak bunun içerisinde tutacağız.Uygulamamızda bulunan bütün sabit değerleri bunun içerisinde tanımlayacağız.

** ben artık primarySwatch parametresine Colors.indigo demeyeceğim de Sabitler.anaRenk diyeceğim.

** ThemeData da bir diğer property visualDensity yani görsel yoğunluk bu property parametre olarak bizden bir VisualDensity türünde veri bekliyor.Bu aslında
şu işe yarıyor flutter farklı farklı platformlarda çalıştığı için bu farklı farklı platformlarda da o ortamlara uyumlu bir şekilde görünmesini sağlıyor....

** visualDensity property'sine parametre olarak VisualDensity.adaptivePlatformDensity'yi veriyoruz bu da işte farklı farklı platformlarda olsa dahi görsel olarak
o platformlara uyum sağlamasını sağlıyor.

** MaterialApp'in bir diğer parametresi olan home'a OrtalamaHesaplaApp() ' i veriyoruz ve uygulamamız artık buradan başlayacak.Yani home propertysine
aslında uygulama açıldığında açılacak olan sayfayı buraya veriyoruz.

** Ben uygulamamın sayfalarını yine ayrı ayrı klasörlerde ele alırsam bizim için daha iyi olacaktır.Benim uygulamam tek bir sayfadan oluştuğu için ben 
pages diye bir klasör açmıyorum da widgets diye bir klasör açıyorum ve bu widgets klasörünün altına da Ortalama Hesapla Widget'ımı oluşturacağım.Yani 
anasayfamı burada oluşturacağım.

** Uygulamamda harf notları tamamen statik değerler yani değişmeyecek olan değerler bu nedenle de bütün verilerin helper klasörü altındaki data_helper.dart
dosyasından gelmesini sağlayacağım.


*/