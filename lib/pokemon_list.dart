import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model/pokedex.dart';


class PokemonList extends StatefulWidget {
  PokemonList({Key key}) : super(key: key);

  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> 
{


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
body:FutureBuilder( future:pokedex(),builder: (context,value){

if(value.hasData){


  var pokedex=value.data;

  return GridView.builder(itemCount:pokedex.pokemon.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2), itemBuilder: (context,index){



return Text(pokedex.pokemon[index].name);




  });
}





})



    );
  }
}