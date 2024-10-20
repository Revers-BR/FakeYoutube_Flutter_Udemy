
import 'package:flutter/material.dart';

class Inscricao extends StatefulWidget {
  
  const Inscricao({super.key});

  @override
  InscricaoState createState() => InscricaoState();
}

class InscricaoState extends State<Inscricao> {
  
  @override
  Widget build( BuildContext context ) {
    return const Center(
      child: Text("Inscrições"),
    );
  }
}
