import 'package:flutter/material.dart';

class EmAlta extends StatefulWidget {
  
  const EmAlta({super.key});

  @override
  EmAltaState createState() => EmAltaState();
}

class EmAltaState extends State<EmAlta> {
  
  @override
  Widget build( BuildContext context ) {
    return const Center(
      child: Text("Em Alta"),
    );
  }
}
