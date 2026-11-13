import 'package:fish_app/models/artwork.dart';
import 'package:flutter/material.dart';

class ArtSlider extends StatelessWidget {

  final List<Artwork> artworks;

  const ArtSlider({super.key, required this.artworks});

  // const MovieSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    if(artworks.isEmpty){
      return SizedBox(
        width: double.infinity,
        height: size.height*0.5,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return SizedBox(
      width: double.infinity,
      height: 280,
      // color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text('Populars',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: artworks.length,
                itemBuilder: (_, int index) => _ArtPoster(art: artworks[index])),
          )
        ],
      ),
    );
  }
}

class _ArtPoster extends StatelessWidget {
  final Artwork art;

  const _ArtPoster({required this.art});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      // color: Colors.green,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',
                arguments: art),
            child: ClipRRect(
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
                width: 130,
                height: 190,
                fit: BoxFit.cover,
              ),
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
