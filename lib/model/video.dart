class Video {

  final String id;

  final String titulo;

  final String tituloCanal;

  final String descricao;

  final String imagem;

  Video(this.id, this.titulo, this.descricao, this.imagem, this.tituloCanal);

  factory Video.fromJson( Map<String, dynamic> json ){
        
    return Video(
    json["id"]["videoId"] as String, 
    json["snippet"]["title"] as String, 
    json["snippet"]["description"] as String, 
    json["snippet"]["thumbnails"]["high"]["url"] as String,
    json["snippet"]["channelTitle"] as String, 
    );
  }
}
