import 'package:card_swiper/card_swiper.dart';
import 'package:fish_app/models/artwork.dart';
import 'package:flutter/material.dart';

class CardSwiper extends StatelessWidget {

  final List<Artwork> artworks;

  const CardSwiper({super.key, required this.artworks});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if(this.artworks.isEmpty){
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
        // Aquest multiplicador estableix el tant per cent de pantalla ocupada 50%
        height: size.height * 0.5,
        // color: Colors.red,
        child: Swiper(
          itemCount: 10,
          layout: SwiperLayout.STACK,
          itemWidth: size.width * 0.6,
          itemHeight: size.height * 0.4,
          itemBuilder: (BuildContext context, int index) {
            final art = artworks[index];
            return GestureDetector(
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
                    fit: BoxFit.cover),
              ),
            );
          },
        ));
  }
}
