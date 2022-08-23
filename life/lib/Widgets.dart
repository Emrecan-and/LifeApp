import 'package:flutter/material.dart';

class Cinsiyet extends StatelessWidget {
  final IconData ikon;
  final String yazi;
  Cinsiyet({this.ikon=Icons.ice_skating,this.yazi="a"});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment:MainAxisAlignment.center,
      children:<Widget> [
        Icon(ikon,size:50),
        SizedBox(height:10,),
        Text(yazi,style:TextStyle(fontSize:20,color:Colors.black54,fontWeight: FontWeight.bold,)),
      ],
    );
  }
}

class NewWidget extends StatelessWidget {
  final Color renk;
  final Widget? child;
  final void Function()? onPress;
  NewWidget({this.renk=Colors.white,this.child,this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onPress,
      child: Container(
        child: child,
        decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),
          color: renk,
        ),
        margin:EdgeInsets.all(12) ,
      ),
    );
  }
}

