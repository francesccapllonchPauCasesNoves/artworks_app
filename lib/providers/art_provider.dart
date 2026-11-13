
import 'package:flutter/material.dart';
import 'package:fish_app/models/nowPlayingArtworks.dart';
import 'package:http/http.dart' as http;
import 'package:fish_app/models/artwork.dart';

class ArtProvider extends ChangeNotifier {
  final String _baseUrl = 'api.artic.edu';
  final String _page = '1';
  final String _page2 = '2';
  final String _page3 = '3';

  List<Artwork> onDisplayArtwork = [];
  List<Artwork> onPopularArtwork = [];
  List<Artwork> onOtherArtwork = [];

  ArtProvider(){
    print('Art provider inicialitzat!');

    getOnDisplayArtworks();
    getOnPopularArtworks();
    getOnOtherArtworks();
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
  Future<void> getOnPopularArtworks()async {
    print('getOnPopularArtworks');
    var url = Uri.https(_baseUrl, 'api/v1/artworks', {
      'page': _page2,
      'limit': '20',
      'is_public_domain': 'true',
      'fields': 'id,title,artist_title,date_display,medium_display,image_id',
    });
    final result = await http.get(url);

    final nowPlayingArtwork = NowPlayingArtworks.fromJson(result.body);

    onPopularArtwork = nowPlayingArtwork.data;

    notifyListeners();
  }

  Future<void> getOnOtherArtworks()async {
    print('getOnOtherArtworks');
    var url = Uri.https(_baseUrl, 'api/v1/artworks', {
      'page': _page3,
      'limit': '20',
      'is_public_domain': 'true',
      'fields': 'id,title,artist_title,date_display,medium_display,image_id',
    });
    final result = await http.get(url);

    final nowPlayingArtwork = NowPlayingArtworks.fromJson(result.body);

    onOtherArtwork = nowPlayingArtwork.data;

    notifyListeners();
  }
}