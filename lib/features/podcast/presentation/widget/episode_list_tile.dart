import 'package:flutter/material.dart';
import 'package:podcast_player_app/features/podcast/data/model/response/podcast_response.dart';

import '../../../episode/presentation/pages/audio_player_page.dart';

class EpisodeListTile extends StatelessWidget {
  final EpisodeListResponse episodes;
  final String publisher;

  const EpisodeListTile({
    Key? key,
    required this.episodes,
    required this.publisher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AudioPlayerPage(
          episodeId: episodes.id,
          publisher: publisher,
        ),
      )),
      child: Container(
        margin: const EdgeInsets.only(top: 16.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.grey.shade200,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 78,
              height: 78,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(episodes.image),
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      episodes.title,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      publisher,
                      style: const TextStyle(color: Colors.orange),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
