import 'package:fake_youtube/custom_search_delegate.dart';
import 'package:fake_youtube/telas/biblioteca.dart';
import 'package:fake_youtube/telas/em_alta.dart';
import 'package:fake_youtube/telas/inicio.dart';
import 'package:fake_youtube/telas/inscricao.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
 
 const Home({super.key});

 @override
 HomeState createState() => HomeState();

}

class HomeState extends State<Home> {

  int _indiceAtual = 0;

  String _resultado = "";


  @override
  Widget build( BuildContext context) {
  
    final List<Widget> telas = [
      Inicio(_resultado),
      const EmAlta(),
      const Inscricao(),
      const Biblioteca()
    ];
    
    return Scaffold(

      appBar: AppBar(

        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.grey
        ),

        title: Image.asset(
        "imagens/youtube.png",
          width: 96, height: 22,
        ),

        actions: [
          
          IconButton(
            onPressed: () async {
              String query = await showSearch(
                context: context, 
                delegate: CustomSearchDelegate()
              ) as String;

              setState(() {
                _resultado = query;
              });
            }, 
            icon: const Icon(
              Icons.search
            )
          ),
          
          /*
          IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.videocam
            )
          ),
             
          IconButton(
            onPressed: (){}, 
            icon: const Icon(
              Icons.account_circle
            )
          ),
          */

        ],
      ),

      body: Container(
        
        padding: const EdgeInsets.all(16),
        child: telas[ _indiceAtual ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        currentIndex: _indiceAtual,
        
        onTap: (indice){
          setState(() {
            _indiceAtual = indice;                   
          });
        },

        items: const[

          BottomNavigationBarItem(
            label: "Inicio",
            icon: Icon(Icons.home)
          ),
          
          BottomNavigationBarItem(
            label: "Em Alta",
            icon: Icon(Icons.whatshot)
          ),
          
          BottomNavigationBarItem(
            label: "Inscrições",
            icon: Icon(Icons.subscriptions)
          ),
          
          BottomNavigationBarItem(
            label: "Biblioteca",
            icon: Icon(Icons.folder)
          ),
        ]
      ),
    );
  }
}
