import 'package:dinamik_not_ortalama_hesaplama_proje/constants/app_constants.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/helper/data_helper.dart';
import 'package:dinamik_not_ortalama_hesaplama_proje/model/ders.dart';
import 'package:flutter/material.dart';

class DersListesi extends StatelessWidget {
  final Function onElemanCikar;
  DersListesi({required this.onElemanCikar, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<Ders> secilenTumDersler = DataHelper.tumEklenenDersler;
    return secilenTumDersler.length > 0
        ? ListView.builder(
            itemBuilder: (context, index) {
              return Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.startToEnd,
                onDismissed: (a) {
                  onElemanCikar(index);
                },
                child: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Card(
                    child: ListTile(
                      title: Text(secilenTumDersler[index].ad),
                      leading: CircleAvatar(
                        backgroundColor: Sabitler.anaRenk,
                        child: Text(
                          (secilenTumDersler[index].harfDegeri *
                                  secilenTumDersler[index].krediDegeri)
                              .toStringAsFixed(0),
                        ),
                      ),
                      subtitle: Text(
                        secilenTumDersler[index].krediDegeri.toString() +
                            " Kredi " +
                            "Not Değeri " +
                            secilenTumDersler[index].harfDegeri.toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount: secilenTumDersler.length,
          )
        : Container(
            child: Center(
              child: Text(
                "Lütfen Ders Ekleyin",
                style: Sabitler.appBarTitleTextStyle,
              ),
            ),
          );
  }
}




/*

** Şimdi biz listedeki herhangi bir elemanı sağa kaydırınca silinmesini istiyoruz şimdi bunu uygulayalım....

** Biz sağa kaydırınca neyi kaybetmek istiyoruz aslında card Widget'ı kaybetmek istiyoruz ama burada padding de aslında card widget'ın bir parçası bu nedenle 
de card widget'ı bir Widget ile sarmalayacağız bu Widget'ımın adı da Dismissible Widget.

** Şimdi biz sağa kaydırınca kaydırdığımız elemanın silinmesini istiyoruz

** sağa kaydırarak silinmesi için Dismissable Widget içerisindeki direction property'sini kullanıyoruz.

** Dismissable Widget'ın bir diğer property'si onDismissed bu property aslında bir callback fonksiyon ve yani kullanıcı bunu yaptğında yani bu ekrandan kaybol-
duğunda neler olacak o mantıkları buraya yazıyoruz. onDismissed callback fonksiyonu burada parametre olarak bir değer veriyor bize bu eğer mesela yön olarak
iki yön tahin ettiyseniz bu zaman önemli ama tek bir yön varsa pek önemli bir şey değil...

** Dismissable Widget required olarak bir child bir de key değeri istiyor ama burada oluşacak olan her eleman birbirinden farklı olması adına bir key değeri
istiyor bizden mesela ben key değerine gidip 1 değerini atarsam hepsinin key değeri 1 olur bu nedenle böyle yapmıyoruz hepsinin birbirinden farklı olması için
Flutter bize UniqueKey diye bir sınıf vermiş bu sınıf napıyor listemize eklenen her bir elemana birbirinden farklı keyler atıyor ve böylelikle biz bir şey sil-
diğimizde gerekli düzenlemeyi veya hangi elemanı sildğinizi ve buradaki Widget Tree'nin  nasıl güncellenmesi gerektiğini Flutter anlıyor işte flutter'ın 
anlaması için key değeri bu nedenle required.


** Şimdi buradaki sıkıntı şu biz dismissable widget ile elemanlarımızı çıkarıyoruz ama ortalama goster kısmı değişmiyor...

** ben burada dismissable widget'tan elemanı sildğimde setState diyorum bu setState benim DersListesi Widget'ımın build metotunu yeniden tetikliyor ve bu
widget'ın ekrandaki görüntüsünü güncelliyor. Bu nedenle de OrtalamaHesaplaPage Widget'ın buildi çalışmadığı için ortalama gösterme panelinin güncellemesi
gerçekleşmiyor.

** Burada aslında bize ne gerekiyor içerideki Widget'tan yukarıdaki Widget'a değer göndermemiz gerekiyor.Yani alttaki Widget bende bir değer değişti ona göre
git güncellemeni yap diyecek yukarıdakı widget'a....


** Şimdi biz Widget'ımızın içerisinde setState kullanmayacağımız için DersListesi Widget'ımızı Stateless Widget haline getiriyoruz.

** burada şöyle düşünüyoruz mesela bizim ortalama hesapla widget içerisinde DersListesi Widget'ımızı çağırırken bunun onDismissable diye bir property'si
olsaydı ben buraya bilgi yollasaydım. yani nasıl ki benim onSaved'im var onValidate'imiz vardı bunlar gibi bir tane callback yapısı olsa bu sorun çözülürdü.

** işte bizde callback fonksiyon oluşturmak için bir tane fonksiyon oluşturuyoruz.

** final Function onElemanCikar; bu tanımlayı yapıyoruz ve daha sonra bunu DersListesi Widget'ının parametresi haline getiriyoruz required ile

** DersListesi({required this.onElemanCikar, Key? key}) : super(key: key);  

** bunu da dedikten sonra DersListesi Widget'ının çağrıldığı yer bağırmaya başlıyor.

** DersListesi Widget'ının çağrıldığı yer OrtalamaHesapla Widget'ı bu yapıyı çağırdığımız yerde biz setState yaparız ve OrtalamaHesapla Widget'ı da bu 
değişiklikten artık haberdar olmuş olacaktır.

** şimdi biz sadece onElemanCikar fonksiyonun tanımlamasını yaptık herhangi bir yerde çağırmadık.

** bunu çağıracağımız yer neresi peki bunu çağıracağımız yer 

 onDismissed: (a) {
                  DataHelper.tumEklenenDersler.removeAt(index);
                },

 burası ve ben buradaki çıkarma işlemini de yukarıdaki widgetta yapacağım bunu da  DataHelper.tumEklenenDersler.removeAt(index); bu işlemi de sildik.

onElemanCikar(index) ifadesini yazıyoruz....

** işte aslında biz burada kendi callback fonksiyonumuz yazıyoruz ve onElemanCikar(index) şu ifadede index bilgisini biz direkt olarak mesela hangi eleman
için sağa kaydırma yani dismiss işlemi yapıldığında o elamın index bilgisini biz üst widget'a yani OrtalamaHesapla Widget'ına bilgi olarak gönderiyoruz.

** ARTIK BUNDAN SONRASI OrtalamaHesapla Widget'ı içerisinden halledilecek.



*/