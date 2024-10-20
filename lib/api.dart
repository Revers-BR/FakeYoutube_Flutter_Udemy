import 'dart:convert';

import 'package:fake_youtube/model/video.dart';
import 'package:http/http.dart' as http;

class API {
  final String _ulrAPI = const String.fromEnvironment("URL_API_YOUTUBE");
  final String _chaveAPIYoutube = const String.fromEnvironment("CHAVE_API_YOUTUBE");
  
  Future<List<Video>> pesquisar (String pesquisa) async {

    final url = Uri.https(
    _ulrAPI,
    "/youtube/v3/search",
    {
        "part": "snippet",
        "maxResults": "20",
        "order": "date",
        "type": "video",
        "key": _chaveAPIYoutube,
        "q": pesquisa
      }
    );

    final http.Response response = await http.get(url);
        
    List<Video> videos = [];

    switch ( response.statusCode ){
      case 200:

        Map<String,dynamic> videoJson = jsonDecode(response.body);

        videos = videoJson["items"].map<Video>(
          (json){
            return Video.fromJson(json);
          }
        ).toList();
    }

    return videos;
  }
}
