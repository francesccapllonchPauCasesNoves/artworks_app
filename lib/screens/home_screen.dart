import 'package:fish_app/models/artwork.dart';
import 'package:fish_app/providers/art_provider.dart';
import 'package:flutter/material.dart';
import 'package:fish_app/widgets/widgets.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final artProvider = Provider.of<ArtProvider>(context);
    print(artProvider.onDisplayArtwork);
    print(artProvider.onPopularArtwork);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cartellera'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(artworks: artProvider.onDisplayArtwork),

              // Slider de pel·licules
              ArtSlider(artworks: artProvider.onPopularArtwork,),
              // Poodeu fer la prova d'afegir-ne uns quants, veureu com cada llista és independent
              // MovieSlider(),
              // MovieSlider(),
            ],
          ),
        ),
      ),
    );
  }
}
