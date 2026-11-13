import 'package:fish_app/models/artwork.dart';
import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {

  final List<Artwork> artworks;
  
  const CastingCards({super.key, required this.artworks});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(artworks.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      width: double.infinity,
      height: 200,
      // color: Colors.red,
        child: ListView.builder(
            itemCount: artworks.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, int index) => _CastCard(art: artworks[index],)),
        );
  }
}

class _CastCard extends StatelessWidget {

  final Artwork art;
  _CastCard({required this.art});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      width: 110,
      // color: Colors.green,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(
                      art.fullImageUrl,
                      headers: const {
                        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                        'Referer': 'https://www.artic.edu/',
                      },
                    ),
              height: 140,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            art.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
