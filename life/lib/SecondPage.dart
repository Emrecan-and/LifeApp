import 'package:flutter/material.dart';
import 'package:life/constants.dart';

import 'inputPage.dart';
class SecondPage extends StatelessWidget {
  Insan human1;
  SecondPage({required this.human1});
  double Hesap(Insan hum){
    double sonuc=90;
    sonuc=sonuc+hum.spor-hum.sigara;
    sonuc=sonuc+(hum.boy/hum.kilo);
    hum.cinsiyet=="KADIN"?sonuc=sonuc+3:sonuc;
    return sonuc;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center ,
          children:<Widget>[
         Text(
         "TAHMİNİ YAŞAM SÜRENİZ ",
          style:TextStyle(fontSize:35,color:Colors.white),
        ),
           Text(
               Hesap(human1).round().toString(),
             style:TextStyle(fontSize:75,color:Colors.white),
           ),
           SizedBox(height: 50,),
           FlatButton(onPressed:(){
    Navigator.pop(context);},shape:CircleBorder(),height:100,color:Colors.white, child:Text("Geri")),
      ],
      ),
    ),
    );
  }
}
