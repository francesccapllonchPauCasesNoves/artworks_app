import 'dart:convert';

class Artwork {
    final int id;
    final String title;
    final String? dateDisplay;
    final String? mediumDisplay;
    final String? artistTitle;
    final String? imageId;

    Artwork({
        required this.id,
        required this.title,
        required this.dateDisplay,
        required this.mediumDisplay,
        required this.artistTitle,
        required this.imageId,
    });

    factory Artwork.fromJson(String str) => Artwork.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory Artwork.fromMap(Map<String, dynamic> json) => Artwork(
        id: json["id"],
        title: json["title"],
        dateDisplay: json["date_display"],
        mediumDisplay: json["medium_display"],
        artistTitle: json["artist_title"],
        imageId: json["image_id"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "title": title,
        "date_display": dateDisplay,
        "medium_display": mediumDisplay,
        "artist_title": artistTitle,
        "image_id": imageId,
    };

    String get fullImageUrl {
    if (imageId != null && imageId!.isNotEmpty) {
      return 'https://www.artic.edu/iiif/2/$imageId/full/843,/0/default.jpg';
    }
    return 'https://placehold.co/300x400/png';
    }
}

  
