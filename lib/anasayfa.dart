import 'package:flutter/material.dart';
import 'package:healtyh_life/asiriObez.dart';
import 'package:healtyh_life/fazlaKilo.dart';
import 'package:healtyh_life/morbidObez.dart';
import 'package:healtyh_life/normalKilo.dart';
import 'package:healtyh_life/obez.dart';
import 'package:healtyh_life/zayif.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  var adiKontrol = TextEditingController();
  var yasKontrol = TextEditingController();
  var boyKontrol = TextEditingController();
  var kiloKontrol = TextEditingController();

  int radioKontrol = 0;

  bool progress = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Text("Healthy Life" , style: TextStyle(color: Colors.white),),
      ),
      backgroundColor: Colors.green,
      centerTitle: true,
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
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("-Adınız-" , style: TextStyle(fontWeight: FontWeight.bold),),
                TextField(
                  controller: adiKontrol,
                  decoration: InputDecoration(hintText: "Ad"),
                  keyboardType: TextInputType.text,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("-Yaşınız-" , style: TextStyle(fontWeight: FontWeight.bold),),
                TextField(
                  controller: yasKontrol,
                  decoration: InputDecoration(hintText: "Yaş"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("-Boyunuz (Örn:1.85)-" , style: TextStyle(fontWeight: FontWeight.bold),),
                TextField(
                  controller: boyKontrol,
                  decoration: InputDecoration(hintText: "Boy"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Text("-Kilonuz (Örn:78)-" , style: TextStyle(fontWeight: FontWeight.bold),),
                TextField(
                  controller: kiloKontrol,
                  decoration: InputDecoration(hintText: "Kilo"),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("-Cinsiyetiniz-" , style: TextStyle(fontWeight: FontWeight.bold),),
          ),

          Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(width: 150,
                child: RadioListTile(
                    title: Text("Erkek" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                    value: 1,
                    groupValue: radioKontrol,
                    onChanged: (veri){

                      setState(() {
                          radioKontrol = veri!;
                      });

                    }),
              ),
              SizedBox(width: 150,
                child: RadioListTile(
                    title: Text("Kız" , style: TextStyle(color: Colors.red , fontWeight: FontWeight.bold),),
                    value: 2,
                    groupValue: radioKontrol,
                    onChanged: (veri){

                      setState(() {
                        radioKontrol = veri!;
                      });

                    }),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                ElevatedButton(onPressed: (){

                  if(adiKontrol.text.isEmpty || yasKontrol.text.isEmpty || boyKontrol.text.isEmpty || kiloKontrol.text.isEmpty){

                    setState(() {
                      progress = false;
                    });

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.black,
                        content: Text("Tüm bölümleri doldurunuz!", style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold),),
                      action: SnackBarAction(label: "Tamam",textColor: Colors.red,onPressed: (){}),
                      )
                    );
                  }
                  else{

                    setState(() {
                      progress = true;
                    });

                    Future.delayed(Duration(seconds: 3), (){

                      String ad = adiKontrol.text.toString();
                      int yas = int.parse(yasKontrol.text);
                      double boy = double.parse(boyKontrol.text);
                      int kilo = int.parse(kiloKontrol.text);
                      String cinsiyet = "";

                      if(radioKontrol == 1){
                          cinsiyet = "Erkek";
                      }

                      else if(radioKontrol == 2){
                          cinsiyet = "Kız";
                      }


                      double vucutIndeks = kilo / (boy * boy);
                      String vucutInde = vucutIndeks.toStringAsFixed(1);
                      double vucutIndex = double.parse(vucutInde);
                      

                      if(vucutIndeks < 18.500000000000000){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Zayif(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }
                      else if(18.500000000000000 <= vucutIndeks && vucutIndeks <= 24.999999999999999){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Normalkilo(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }
                      else if(25 <= vucutIndeks && vucutIndeks <= 29.999999999999999){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Fazlakilo(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }
                      else if(30 <= vucutIndeks && vucutIndeks <= 34.999999999999999){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Obez(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }
                      else if(35 <= vucutIndeks && vucutIndeks <= 39.999999999999999){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Asiriobez(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }
                      else if(40 <= vucutIndeks){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Morbidobez(ad: ad, yas: yas, boy: boy, kilo: kilo, cinsiyet: cinsiyet, vucutIndeks: vucutIndex)));
                      }


                      setState(() {
                        progress = false;
                        adiKontrol.text = "";
                        yasKontrol.text = "";
                        boyKontrol.text = "";
                        kiloKontrol.text = "";
                        radioKontrol = 0;
                      });
                    });
                  }
                },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("Gönder" , style: TextStyle(color: Colors.white),))
              ],
            ),
          ),
          Column(
            children: [
              Visibility(
                child: const CircularProgressIndicator(),
                visible: progress,
              ),
            ],
          ),
        ],
      ),
    );
  }
}