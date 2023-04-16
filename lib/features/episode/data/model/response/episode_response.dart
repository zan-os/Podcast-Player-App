import 'dart:convert';

EpisodeResponse episodeDetailResponseFromJson(String str) =>
    EpisodeResponse.fromJson(json.decode(str));

String episodeDetailResponseToJson(EpisodeResponse data) =>
    json.encode(data.toJson());

class EpisodeResponse {
  EpisodeResponse({
    required this.id,
    required this.title,
    required this.description,
    required this.pubDateMs,
    required this.audio,
    required this.audioLengthSec,
    required this.listennotesUrl,
    required this.image,
    required this.thumbnail,
    required this.maybeAudioInvalid,
    required this.listennotesEditUrl,
    required this.explicitContent,
    required this.link,
    required this.guidFromRss,
    required this.podcast,
  });

  String id;
  String title;
  String description;
  int pubDateMs;
  String audio;
  int audioLengthSec;
  String listennotesUrl;
  String image;
  String thumbnail;
  bool maybeAudioInvalid;
  String listennotesEditUrl;
  bool explicitContent;
  String link;
  String guidFromRss;
  Podcast podcast;

  factory EpisodeResponse.fromJson(Map<String, dynamic> json) =>
      EpisodeResponse(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        pubDateMs: json["pub_date_ms"],
        audio: json["audio"],
        audioLengthSec: json["audio_length_sec"],
        listennotesUrl: json["listennotes_url"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        maybeAudioInvalid: json["maybe_audio_invalid"],
        listennotesEditUrl: json["listennotes_edit_url"],
        explicitContent: json["explicit_content"],
        link: json["link"],
        guidFromRss: json["guid_from_rss"],
        podcast: Podcast.fromJson(json["podcast"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "pub_date_ms": pubDateMs,
        "audio": audio,
        "audio_length_sec": audioLengthSec,
        "listennotes_url": listennotesUrl,
        "image": image,
        "thumbnail": thumbnail,
        "maybe_audio_invalid": maybeAudioInvalid,
        "listennotes_edit_url": listennotesEditUrl,
        "explicit_content": explicitContent,
        "link": link,
        "guid_from_rss": guidFromRss,
        "podcast": podcast.toJson(),
      };
}

class Podcast {
  Podcast({
    required this.id,
    required this.title,
    required this.publisher,
    required this.image,
    required this.thumbnail,
    required this.listennotesUrl,
    required this.listenScore,
    required this.listenScoreGlobalRank,
    required this.totalEpisodes,
    required this.audioLengthSec,
    required this.updateFrequencyHours,
    required this.explicitContent,
    required this.description,
    required this.itunesId,
    required this.rss,
    required this.latestPubDateMs,
    required this.latestEpisodeId,
    required this.earliestPubDateMs,
    required this.language,
    required this.country,
    required this.website,
    required this.extra,
    required this.isClaimed,
    required this.email,
    required this.type,
    required this.lookingFor,
    required this.genreIds,
  });

  String id;
  String title;
  String publisher;
  String image;
  String thumbnail;
  String listennotesUrl;
  String listenScore;
  String listenScoreGlobalRank;
  int totalEpisodes;
  int audioLengthSec;
  int updateFrequencyHours;
  bool explicitContent;
  String description;
  int itunesId;
  String rss;
  int latestPubDateMs;
  String latestEpisodeId;
  int earliestPubDateMs;
  String language;
  String country;
  String website;
  Extra extra;
  bool isClaimed;
  String email;
  String type;
  LookingFor lookingFor;
  List<int> genreIds;

  factory Podcast.fromJson(Map<String, dynamic> json) => Podcast(
        id: json["id"],
        title: json["title"],
        publisher: json["publisher"],
        image: json["image"],
        thumbnail: json["thumbnail"],
        listennotesUrl: json["listennotes_url"],
        listenScore: json["listen_score"],
        listenScoreGlobalRank: json["listen_score_global_rank"],
        totalEpisodes: json["total_episodes"],
        audioLengthSec: json["audio_length_sec"],
        updateFrequencyHours: json["update_frequency_hours"],
        explicitContent: json["explicit_content"],
        description: json["description"],
        itunesId: json["itunes_id"],
        rss: json["rss"],
        latestPubDateMs: json["latest_pub_date_ms"],
        latestEpisodeId: json["latest_episode_id"],
        earliestPubDateMs: json["earliest_pub_date_ms"],
        language: json["language"],
        country: json["country"],
        website: json["website"],
        extra: Extra.fromJson(json["extra"]),
        isClaimed: json["is_claimed"],
        email: json["email"],
        type: json["type"],
        lookingFor: LookingFor.fromJson(json["looking_for"]),
        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "publisher": publisher,
        "image": image,
        "thumbnail": thumbnail,
        "listennotes_url": listennotesUrl,
        "listen_score": listenScore,
        "listen_score_global_rank": listenScoreGlobalRank,
        "total_episodes": totalEpisodes,
        "audio_length_sec": audioLengthSec,
        "update_frequency_hours": updateFrequencyHours,
        "explicit_content": explicitContent,
        "description": description,
        "itunes_id": itunesId,
        "rss": rss,
        "latest_pub_date_ms": latestPubDateMs,
        "latest_episode_id": latestEpisodeId,
        "earliest_pub_date_ms": earliestPubDateMs,
        "language": language,
        "country": country,
        "website": website,
        "extra": extra.toJson(),
        "is_claimed": isClaimed,
        "email": email,
        "type": type,
        "looking_for": lookingFor.toJson(),
        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
      };
}

class Extra {
  Extra({
    required this.twitterHandle,
    required this.facebookHandle,
    required this.instagramHandle,
    required this.wechatHandle,
    required this.patreonHandle,
    required this.youtubeUrl,
    required this.linkedinUrl,
    required this.spotifyUrl,
    required this.googleUrl,
    required this.amazonMusicUrl,
    required this.url1,
    required this.url2,
    required this.url3,
  });

  String twitterHandle;
  String facebookHandle;
  String instagramHandle;
  String wechatHandle;
  String patreonHandle;
  String youtubeUrl;
  String linkedinUrl;
  String spotifyUrl;
  String googleUrl;
  String amazonMusicUrl;
  String url1;
  String url2;
  String url3;

  factory Extra.fromJson(Map<String, dynamic> json) => Extra(
        twitterHandle: json["twitter_handle"],
        facebookHandle: json["facebook_handle"],
        instagramHandle: json["instagram_handle"],
        wechatHandle: json["wechat_handle"],
        patreonHandle: json["patreon_handle"],
        youtubeUrl: json["youtube_url"],
        linkedinUrl: json["linkedin_url"],
        spotifyUrl: json["spotify_url"],
        googleUrl: json["google_url"],
        amazonMusicUrl: json["amazon_music_url"],
        url1: json["url1"],
        url2: json["url2"],
        url3: json["url3"],
      );

  Map<String, dynamic> toJson() => {
        "twitter_handle": twitterHandle,
        "facebook_handle": facebookHandle,
        "instagram_handle": instagramHandle,
        "wechat_handle": wechatHandle,
        "patreon_handle": patreonHandle,
        "youtube_url": youtubeUrl,
        "linkedin_url": linkedinUrl,
        "spotify_url": spotifyUrl,
        "google_url": googleUrl,
        "amazon_music_url": amazonMusicUrl,
        "url1": url1,
        "url2": url2,
        "url3": url3,
      };
}

class LookingFor {
  LookingFor({
    required this.sponsors,
    required this.guests,
    required this.cohosts,
    required this.crossPromotion,
  });

  bool sponsors;
  bool guests;
  bool cohosts;
  bool crossPromotion;

  factory LookingFor.fromJson(Map<String, dynamic> json) => LookingFor(
        sponsors: json["sponsors"],
        guests: json["guests"],
        cohosts: json["cohosts"],
        crossPromotion: json["cross_promotion"],
      );

  Map<String, dynamic> toJson() => {
        "sponsors": sponsors,
        "guests": guests,
        "cohosts": cohosts,
        "cross_promotion": crossPromotion,
      };
}
