
import 'package:flutter/material.dart';
import 'package:fish_app/models/nowPlayingArtworks.dart';
import 'package:http/http.dart' as http;
import 'package:fish_app/models/artwork.dart';

class ArtProvider extends ChangeNotifier {
  final String _baseUrl = 'api.artic.edu';
  final String _page = '1';

  List<Artwork> onDisplayArtwork = [];

  ArtProvider(){
    print('Fish provider inicialitzat!');

    getOnDisplayArtworks();
  }

  Future<void> getOnDisplayArtworks()async {
    print('getOnDisplayArtworks');
    var url = Uri.https(_baseUrl, 'api/v1/artworks', {
      'page': _page,
      'limit': '20',
      'is_public_domain': 'true',
      'fields': 'id,title,artist_title,date_display,medium_display,image_id',
    });
    final result = await http.get(url);

    final nowPlayingArtwork = NowPlayingArtworks.fromJson(result.body);

    onDisplayArtwork = nowPlayingArtwork.data;

    notifyListeners();
  }
}