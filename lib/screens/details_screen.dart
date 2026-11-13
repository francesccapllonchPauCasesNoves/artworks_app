import 'package:fish_app/models/artwork.dart';
import 'package:fish_app/providers/art_provider.dart';
import 'package:flutter/material.dart';
import 'package:fish_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Canviar després per una instància de Peli
    final Artwork artwork =
        ModalRoute.of(context)?.settings.arguments as Artwork;

    final artProvider = Provider.of<ArtProvider>(context);
    

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar(art: artwork,),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                _PosterAndTitile(art: artwork,),
                _Overview(art: artwork),
                CastingCards(artworks: artProvider.onOtherArtwork,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget {
  final Artwork art;

  _CustomAppBar({super.key, required this.art});

  @override
  Widget build(BuildContext context) {
    // Exactament igual que la AppBaer però amb bon comportament davant scroll
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            art.title,
            style: TextStyle(fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(
                      art.fullImageUrl,
                      headers: const {
                        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                        'Referer': 'https://www.artic.edu/',
                      },
                    ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterAndTitile extends StatelessWidget {

  final Artwork art;

  _PosterAndTitile({super.key, required this.art});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
              placeholder: AssetImage('assets/loading.gif'),
              image: NetworkImage(
                      art.fullImageUrl,
                      headers: const {
                        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36',
                        'Referer': 'https://www.artic.edu/',
                      },
                    ),
              height: 150,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  art.title,
                  style: textTheme.headlineSmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  art.mediumDisplay ?? 'Medium not known',
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Text(
                  art.artistTitle ?? 'Unknown artist',
                  style: textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                Row(
                  children: [
                    const Icon(Icons.date_range, size: 15, color: Colors.grey),
                    const SizedBox(width: 5),
                    Text(art.dateDisplay ?? 'Date display not known',
                    style: textTheme.bodySmall),
                  ],
                )
              ],
            )
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final Artwork art;
  const _Overview({required this.art});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Other art',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
