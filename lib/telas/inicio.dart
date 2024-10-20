import 'package:fake_youtube/api.dart';
import 'package:fake_youtube/model/video.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart'; 
  
class Inicio extends StatefulWidget {

  final String _pesquisa;
  
  const Inicio(this._pesquisa, {super.key});

  @override
  InicioState createState() => InicioState();
}

class InicioState extends State<Inicio> {

  final API _api = API();

  final YoutubePlayerController _controller = YoutubePlayerController();
  
  @override
  Widget build( BuildContext context ) {

    return FutureBuilder(
      future: _api.pesquisar( widget._pesquisa), 
      builder: (context, snapshot){

        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){

              final List<Video> videos = snapshot.data as List<Video>;
              
              return ListView.separated(
                itemBuilder: (context, index) {

                  final Video video = videos[index];

                  return GestureDetector(
                    onTap: (){

                      _controller.loadVideoById(
                        videoId: video.id
                      );

                      YoutubePlayer(
                        controller: _controller
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                              video.imagem
                              ),
                              fit:BoxFit.cover
                            )
                          ),
                        ),
                        ListTile(
                          title: Text( video.titulo),
                          subtitle: Text(video.tituloCanal),
                        )
                      ],
                   ) 
                  );
                }, 
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.grey,
                  height:  20,
                ),
                itemCount: videos.length
              );
            }         
            
            return const Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }
}
