import 'package:flutter/material.dart';
import 'package:life/SecondPage.dart';
import 'Widgets.dart';
import 'constants.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Insan human= Insan(boy:170,cinsiyet:"KA",kilo:70,spor:0,sigara:0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'YAŞAM BEKLENTİSİ',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(child: NewWidget(
                child:buildRowOutlinedButton("BOY",human.boy),
              )),
              SizedBox(width:30,),
              Expanded(child: NewWidget(
                child:buildRowOutlinedButton("KİLO",human.kilo),
              )),
            ],
              ),
           ),
          SizedBox(height: 25,),
          Expanded(child: NewWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HAFTADA KAÇ KERE SPOR YAPIYORSUNUZ?', style: sitil),
                Text('${human.spor.round()}', style: sitil,),
                Slider(value:human.spor,min:0,max:7,
                    onChanged:(double newValue){
                      setState((){
                        human.spor=newValue;
                      });
                    }),
              ],
            ),
          )),
          SizedBox(height: 25,),
          Expanded(child: NewWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('GÜNDE NE KADAR SİGARA İÇİYORSUNUZ', style: sitil),
                Text('${human.sigara.round()}', style: sitil,),
              Slider(value:human.sigara,min:0,max:40,
                onChanged:(double newValue){
                      setState((){
                       human.sigara=newValue;
                      });
                    }),
              ],
            ),
          )),
          SizedBox(height: 25,),
          Expanded(child: Row(children: <Widget>[
            Expanded(child: NewWidget(
              onPress: () {
                setState(() {
                  human.cinsiyet = "KADIN";
                });
              },
              renk: human.cinsiyet == "KADIN" ? Colors.grey : Colors.white,
              child: Cinsiyet(
                ikon: Icons.woman,
                yazi: "KADIN",
              ),
            )),
            SizedBox(width: 30,),
            Expanded(child: NewWidget(
              onPress: () {
                setState(() {
                  human.cinsiyet = "ADAM";
                });
              },
              renk: human.cinsiyet == "ADAM" ? Colors.grey : Colors.white,
              child: Cinsiyet(
                ikon: Icons.man,
                yazi: "ERKEK",
              ),
            )),
          ],
          ),),
          ButtonTheme(
            child: FlatButton(color:Colors.white,height: 50,
                onPressed:(){
                 Navigator.push(context,MaterialPageRoute(builder: (context)=>SecondPage(human1:human,)) );
            }, child:Text('HESAPLA')),
          ),
        ],
      ),
    );
  }

  Row buildRowOutlinedButton(String a,int x) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        RotatedBox(
            quarterTurns: -1,
            child: Text(a, style: sitil,)),
        SizedBox(width: 10),
        RotatedBox(
            quarterTurns: -1,
            child: Text(x.toString(), style: TextStyle(fontSize: 40),)),
        SizedBox(width: 10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    a == "BOY" ? human.boy++ : human.kilo++;
                  });
                },
                child: Icon(Icons.plus_one_outlined),
              ),
            ),
            ButtonTheme(
              minWidth: 36,
              child: OutlinedButton(
                onPressed: () {
                  setState(() {
                    a == "BOY" ? human.boy-- : human.kilo--;
                  });
                },
                child: Icon(Icons.exposure_minus_1_outlined),),
            ),
          ],
        ),
      ],
    );
  }
}
class Insan{
  String cinsiyet = "KA";
  double sigara = 0;
  double spor=0;
  int boy=170;
  int kilo=70;
  Insan({this.kilo=70,this.boy=170,this.sigara=0,this.cinsiyet="KA",this.spor=0});
}
