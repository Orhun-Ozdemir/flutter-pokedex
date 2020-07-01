import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:pokedex_app/pokemdetay.dart';

import 'model/pokedex.dart';


class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}



class _PokemonListState extends State<PokemonList> 
{
Future<Pokedex> poke;


@override
void initState() { 
     
  super.initState();
  poke=pokedex();

}

Future<Pokedex> pokedex()async{

var value= await http.get("https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json");
Pokedex pokedex;
var jdecode=json.decode(value.body);
pokedex=Pokedex.fromJson(jdecode);
return pokedex;}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

appBar: AppBar(),
body:
OrientationBuilder(builder: (context,orientation){

if(orientation==Orientation.portrait){


  return FutureBuilder( future:poke,builder: (context,value){
  if(value.connectionState == ConnectionState.waiting){

return Center(child:CircularProgressIndicator(),
);
  }

if (value.connectionState == ConnectionState.done){




  return GridView.builder(itemCount:value.data.pokemon.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){

               debugPrint(value.data.pokemon[index].img);
return InkWell(
  onTap:(){

Navigator.push(context, MaterialPageRoute(builder:(context){

return PokemonDetail(value.data.pokemon[index]);

}));
  }
  ,child:Hero(tag: value.data.pokemon[index].img,
  child:
Card(child:
Container(
  width:100,
  height:150,
  child:
Column(
children: <Widget>[
//Image.network(pokedex.pokemon[index].img),
FadeInImage.assetNetwork(placeholder: "assets/images/giphy.gif", image: "${value.data.pokemon[index].img}"),

Text(value.data.pokemon[index].name),




],




),))));




  });
}





});
}
else{

return FutureBuilder( future:poke,builder: (context,value){
  if(value.connectionState == ConnectionState.waiting){

return Center(child:CircularProgressIndicator(),
);
  }

if (value.connectionState == ConnectionState.done){




  return GridView.builder(itemCount:value.data.pokemon.length,gridDelegate:SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300),itemBuilder: (context,index){

               debugPrint(value.data.pokemon[index].img);
return InkWell(
  onTap:(){

Navigator.push(context, MaterialPageRoute(builder:(context){

return PokemonDetail(value.data.pokemon[index]);

}));
  }
  ,child:Hero(tag: value.data.pokemon[index].img,
  child:
Card(child:
Container(
  width:100,
  height:200,
  child:
Column(
children: <Widget>[
//Image.network(pokedex.pokemon[index].img),
FadeInImage.assetNetwork(placeholder: "assets/images/giphy.gif", image: "${value.data.pokemon[index].img}"),

Text(value.data.pokemon[index].name),




],




),))));




  });
}





});


}


})




    );
  }
}