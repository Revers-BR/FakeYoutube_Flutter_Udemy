
import 'package:flutter/material.dart';

class Biblioteca extends StatefulWidget {
  
  const Biblioteca({super.key});

  @override
  BibliotecaState createState() => BibliotecaState();
}

class BibliotecaState extends State<Biblioteca> {
  
  @override
  Widget build( BuildContext context ) {
    return const Center(
      child: Text("Biblioteca"),
    );
  }
}
