import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/pokemon_list.dart';

void main(){


runApp(MaterialApp(

debugShowCheckedModeBanner: false,

home:PokemonList(),
),
);
}




