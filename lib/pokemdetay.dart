
import 'package:flutter/material.dart';
import 'package:pokedex_app/model/pokedex.dart';

class PokemonDetail extends StatelessWidget {

  Pokemon detay;
  
  PokemonDetail(this.detay);
 
   

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: Colors.yellowAccent,
   appBar: PreferredSize( preferredSize:Size.fromHeight(30),child: AppBar(backgroundColor: Colors.yellowAccent,elevation: 0,)),
     body: OrientationBuilder(builder: (context,orientation){

if (orientation==Orientation.portrait){


  return dikeytutus(context, detay);
}
else{


return yataybakis(context, detay);




}

     }),
     
     
     
     

    );
  }
}



Stack yataybakis(BuildContext context, Pokemon detay)

{


return Stack(

children:<Widget>[

Positioned(

width:MediaQuery.of(context).size.width*(0.95),
height:MediaQuery.of(context).size.height*(0.850),
left: MediaQuery.of(context).size.width*(1/60),
bottom: MediaQuery.of(context).size.height*(1/100),
//top: MediaQuery.of(context).size.height*(1/40),
child: Container(

decoration:BoxDecoration(color:Colors.white,borderRadius: BorderRadius.circular(20)),
child: Row(

children: <Widget>[

Row(children: <Widget>[
Container(
  width:200,
  height: 200,
  child:
Image.network(detay.img,fit:BoxFit.cover),

),

Container(
color:Colors.white,
width:MediaQuery.of(context).size.width*(0.95)-200,
height:MediaQuery.of(context).size.height*(0.850),

child:Column(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children:<Widget>[ 
   Text(detay.name),
   Text(detay.num),
   Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children:detay.type.map((tip) =>  Chip(backgroundColor: Colors.orangeAccent,label: Text(tip),)).toList(),
 ),


Text("Pre Evalution",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.prevEvolution !=null ? detay.prevEvolution.map((evalution) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(evalution.name))).toList()
   : [Text("Başlangıç")],
),



// NEXT EVALUTİON
Text("Next Evalution",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.nextEvolution !=null ? detay.nextEvolution.map((evalution) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(evalution.name))).toList()
   : [Text("Son Evrim")],
),

Text("Weakness",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.weaknesses !=null ? detay.weaknesses.map((weakness) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(weakness))).toList()
   : [Text("Son Evrim")],
)

 ]
 ), 

)


],
)





],


),


)




)


]



);


}














Stack dikeytutus( BuildContext context,Pokemon detay){
 BuildContext asm=context;
return Stack(

       children:<Widget>[

Positioned(
left:20,
top:MediaQuery.of(context).size.height*0.1,
width:MediaQuery.of(context).size.width*(0.9),
height: MediaQuery.of(context).size.height*0.6,
child: 
Card(
shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)),
elevation: 14,

 child:Column(
   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children:<Widget>[ 
   Text(detay.name),
   Text(detay.num),
   Row(

mainAxisAlignment: MainAxisAlignment.spaceEvenly,
   children:detay.type.map((tip) =>  Chip(backgroundColor: Colors.orangeAccent,label: Text(tip),)).toList(),
 ),


Text("Pre Evalution",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.prevEvolution !=null ? detay.prevEvolution.map((evalution) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(evalution.name))).toList()
   : [Text("Başlangıç")],
),



// NEXT EVALUTİON
Text("Next Evalution",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.nextEvolution !=null ? detay.nextEvolution.map((evalution) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(evalution.name))).toList()
   : [Text("Son Evrim")],
),

Text("Weakness",style:TextStyle(fontSize: 25)),

Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

  children:detay.weaknesses !=null ? detay.weaknesses.map((weakness) => Chip(backgroundColor:Colors.orangeAccent ,label:Text(weakness))).toList()
   : [Text("Son Evrim")],
)

 ]
 ),
),
 


),

Align(

  alignment:Alignment.topCenter,
  child:Hero(tag:detay.img, 
  child:Image.network("${detay.img}" ,fit: BoxFit.contain,) ,)
)



       ]
     );



}