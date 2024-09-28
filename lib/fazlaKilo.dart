import 'package:flutter/material.dart';

class Fazlakilo extends StatefulWidget {

  String ad;
  int yas;
  double boy;
  int kilo;
  String cinsiyet;
  double vucutIndeks;

  Fazlakilo({required this.ad,required this.yas,required this.boy,required this.kilo,required this.cinsiyet,required this.vucutIndeks});

  @override
  State<Fazlakilo> createState() => _FazlakiloState();
}

class _FazlakiloState extends State<Fazlakilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
        Text("Healthy Life" , style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Image.asset("resimler/heart.png", width: 35, height: 35,),
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column( crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Kullanıcı Bilgileri" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold , fontSize: 15),),
                    Text("Ad : ${widget.ad}" , style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Yaş : ${widget.yas}", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Boy : ${widget.boy} m", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Kilo : ${widget.kilo} kg", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("Cinsiyet : ${widget.cinsiyet}", style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("İndeks Sonucunuz", style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold , fontSize: 15),),
                    Text("Şişman İndeks", style: TextStyle(fontWeight: FontWeight.bold),),
                    Text("İndeks Değeri : ${widget.vucutIndeks}" , style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(""),
                    Text(""),
                    Text(""),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(65),
            child: Column(
              children: [
                Image.asset("resimler/sisman.png")
              ],
            ),
          ),
          Text("Şişman İndeks" , style: TextStyle(fontWeight: FontWeight.bold , color: Colors.red , fontSize: 20),),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Text("Boyunuza göre kilolusunuz.Sağlığınız için düzenli ve dengeli beslenmeniz gerekmektedir.Diyetisyenler veya doktorlardan destek alabilirsiniz.Spor yapmayı ihmal etmeyiniz." , style: TextStyle(fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Healthy Life\t", style: TextStyle(fontSize: 20),),
                Image.asset("resimler/healthy_life.png",width: 40,height: 40,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}