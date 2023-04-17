// To parse this JSON data, do
//
//     final detailGameModel = detailGameModelFromJson(jsonString);

import 'dart:convert';

DetailGameModel detailGameModelFromJson(String str) =>
    DetailGameModel.fromJson(json.decode(str));

String detailGameModelToJson(DetailGameModel data) =>
    json.encode(data.toJson());

class DetailGameModel {
  DetailGameModel({
    this.id,
    this.slug,
    this.name,
    this.nameOriginal,
    this.description,
    this.metacritic,
    this.metacriticPlatforms,
    this.released,
    this.tba,
    this.updated,
    this.backgroundImage,
    this.backgroundImageAdditional,
    this.website,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.reactions,
    this.added,
    this.addedByStatus,
    this.playtime,
    this.screenshotsCount,
    this.moviesCount,
    this.creatorsCount,
    this.achievementsCount,
    this.parentAchievementsCount,
    this.redditUrl,
    this.redditName,
    this.redditDescription,
    this.redditLogo,
    this.redditCount,
    this.twitchCount,
    this.youtubeCount,
    this.reviewsTextCount,
    this.ratingsCount,
    this.suggestionsCount,
    this.alternativeNames,
    this.metacriticUrl,
    this.parentsCount,
    this.additionsCount,
    this.gameSeriesCount,
    this.userGame,
    this.reviewsCount,
    this.communityRating,
    this.saturatedColor,
    this.dominantColor,
    this.parentPlatforms,
    this.platforms,
    this.stores,
    this.developers,
    this.genres,
    this.tags,
    this.publishers,
    this.esrbRating,
    this.clip,
    this.descriptionRaw,
  });

  final String? id;
  final String? slug;
  final String? name;
  final String? nameOriginal;
  final String? description;
  final dynamic metacritic;
  final List<dynamic>? metacriticPlatforms;
  final DateTime? released;
  final bool? tba;
  final DateTime? updated;
  final String? backgroundImage;
  final String? backgroundImageAdditional;
  final String? website;
  final String? rating;
  final String? ratingTop;
  final List<dynamic>? ratings;
  final Reactions? reactions;
  final String? added;
  final AddedByStatus? addedByStatus;
  final String? playtime;
  final String? screenshotsCount;
  final String? moviesCount;
  final String? creatorsCount;
  final String? achievementsCount;
  final String? parentAchievementsCount;
  final String? redditUrl;
  final String? redditName;
  final String? redditDescription;
  final String? redditLogo;
  final String? redditCount;
  final String? twitchCount;
  final String? youtubeCount;
  final String? reviewsTextCount;
  final String? ratingsCount;
  final String? suggestionsCount;
  final List<dynamic>? alternativeNames;
  final String? metacriticUrl;
  final String? parentsCount;
  final String? additionsCount;
  final String? gameSeriesCount;
  final dynamic userGame;
  final String? reviewsCount;
  final String? communityRating;
  final String? saturatedColor;
  final String? dominantColor;
  final List<ParentPlatform>? parentPlatforms;
  final List<PlatformElement>? platforms;
  final List<Store>? stores;
  final List<Developer>? developers;
  final List<Developer>? genres;
  final List<Developer>? tags;
  final List<Developer>? publishers;
  final EsrbRating? esrbRating;
  final dynamic clip;
  final String? descriptionRaw;

  factory DetailGameModel.fromJson(Map<String, dynamic> json) =>
      DetailGameModel(
        id: json["id"].toString(),
        slug: json["slug"],
        name: json["name"],
        nameOriginal: json["name_original"],
        description: json["description"],
        metacritic: json["metacritic"],
        metacriticPlatforms: json["metacritic_platforms"] == null
            ? []
            : List<dynamic>.from(json["metacritic_platforms"]!.map((x) => x)),
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        backgroundImage: json["background_image"],
        backgroundImageAdditional: json["background_image_additional"],
        website: json["website"],
        rating: json["rating"].toString(),
        ratingTop: json["rating_top"].toString(),
        ratings: json["ratings"] == null
            ? []
            : List<dynamic>.from(json["ratings"]!.map((x) => x)),
        reactions: json["reactions"] == null
            ? null
            : Reactions.fromJson(json["reactions"]),
        added: json["added"].toString(),
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromJson(json["added_by_status"]),
        playtime: json["playtime"].toString(),
        screenshotsCount: json["screenshots_count"].toString(),
        moviesCount: json["movies_count"].toString(),
        creatorsCount: json["creators_count"].toString(),
        achievementsCount: json["achievements_count"].toString(),
        parentAchievementsCount: json["parent_achievements_count"].toString(),
        redditUrl: json["reddit_url"],
        redditName: json["reddit_name"],
        redditDescription: json["reddit_description"],
        redditLogo: json["reddit_logo"],
        redditCount: json["reddit_count"].toString(),
        twitchCount: json["twitch_count"].toString(),
        youtubeCount: json["youtube_count"].toString(),
        reviewsTextCount: json["reviews_text_count"].toString(),
        ratingsCount: json["ratings_count"].toString(),
        suggestionsCount: json["suggestions_count"].toString(),
        alternativeNames: json["alternative_names"] == null
            ? []
            : List<dynamic>.from(json["alternative_names"]!.map((x) => x)),
        metacriticUrl: json["metacritic_url"],
        parentsCount: json["parents_count"].toString(),
        additionsCount: json["additions_count"].toString(),
        gameSeriesCount: json["game_series_count"].toString(),
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"].toString(),
        communityRating: json["community_rating"].toString(),
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<ParentPlatform>.from(json["parent_platforms"]!
                .map((x) => ParentPlatform.fromJson(x))),
        platforms: json["platforms"] == null
            ? []
            : List<PlatformElement>.from(
                json["platforms"]!.map((x) => PlatformElement.fromJson(x))),
        stores: json["stores"] == null
            ? []
            : List<Store>.from(json["stores"]!.map((x) => Store.fromJson(x))),
        developers: json["developers"] == null
            ? []
            : List<Developer>.from(
                json["developers"]!.map((x) => Developer.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<Developer>.from(
                json["genres"]!.map((x) => Developer.fromJson(x))),
        tags: json["tags"] == null
            ? []
            : List<Developer>.from(
                json["tags"]!.map((x) => Developer.fromJson(x))),
        publishers: json["publishers"] == null
            ? []
            : List<Developer>.from(
                json["publishers"]!.map((x) => Developer.fromJson(x))),
        esrbRating: json["esrb_rating"] == null
            ? null
            : EsrbRating.fromJson(json["esrb_rating"]),
        clip: json["clip"],
        descriptionRaw: json["description_raw"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "name": name,
        "name_original": nameOriginal,
        "description": description,
        "metacritic": metacritic,
        "metacritic_platforms": metacriticPlatforms == null
            ? []
            : List<dynamic>.from(metacriticPlatforms!.map((x) => x)),
        "released":
            "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "updated": updated?.toIso8601String(),
        "background_image": backgroundImage,
        "background_image_additional": backgroundImageAdditional,
        "website": website,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings":
            ratings == null ? [] : List<dynamic>.from(ratings!.map((x) => x)),
        "reactions": reactions?.toJson(),
        "added": added,
        "added_by_status": addedByStatus?.toJson(),
        "playtime": playtime,
        "screenshots_count": screenshotsCount,
        "movies_count": moviesCount,
        "creators_count": creatorsCount,
        "achievements_count": achievementsCount,
        "parent_achievements_count": parentAchievementsCount,
        "reddit_url": redditUrl,
        "reddit_name": redditName,
        "reddit_description": redditDescription,
        "reddit_logo": redditLogo,
        "reddit_count": redditCount,
        "twitch_count": twitchCount,
        "youtube_count": youtubeCount,
        "reviews_text_count": reviewsTextCount,
        "ratings_count": ratingsCount,
        "suggestions_count": suggestionsCount,
        "alternative_names": alternativeNames == null
            ? []
            : List<dynamic>.from(alternativeNames!.map((x) => x)),
        "metacritic_url": metacriticUrl,
        "parents_count": parentsCount,
        "additions_count": additionsCount,
        "game_series_count": gameSeriesCount,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "community_rating": communityRating,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "parent_platforms": parentPlatforms == null
            ? []
            : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "platforms": platforms == null
            ? []
            : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "stores": stores == null
            ? []
            : List<dynamic>.from(stores!.map((x) => x.toJson())),
        "developers": developers == null
            ? []
            : List<dynamic>.from(developers!.map((x) => x.toJson())),
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
        "tags": tags == null
            ? []
            : List<dynamic>.from(tags!.map((x) => x.toJson())),
        "publishers": publishers == null
            ? []
            : List<dynamic>.from(publishers!.map((x) => x.toJson())),
        "esrb_rating": esrbRating?.toJson(),
        "clip": clip,
        "description_raw": descriptionRaw,
      };
}

class AddedByStatus {
  AddedByStatus({
    this.owned,
    this.toplay,
  });

  final String? owned;
  final String? toplay;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        owned: json["owned"].toString(),
        toplay: json["toplay"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "owned": owned,
        "toplay": toplay,
      };
}

class Developer {
  Developer({
    this.id,
    this.name,
    this.slug,
    this.gamesCount,
    this.imageBackground,
    this.domain,
    this.language,
  });

  final String? id;
  final String? name;
  final String? slug;
  final String? gamesCount;
  final String? imageBackground;
  final String? domain;
  final Language? language;

  factory Developer.fromJson(Map<String, dynamic> json) => Developer(
        id: json["id"].toString(),
        name: json["name"],
        slug: json["slug"],
        gamesCount: json["games_count"].toString(),
        imageBackground: json["image_background"],
        domain: json["domain"],
        language: languageValues.map[json["language"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "games_count": gamesCount,
        "image_background": imageBackground,
        "domain": domain,
        "language": languageValues.reverse[language],
      };
}

enum Language { ENG }

final languageValues = EnumValues({"eng": Language.ENG});

class EsrbRating {
  EsrbRating({
    this.id,
    this.name,
    this.slug,
  });

  final String? id;
  final String? name;
  final String? slug;

  factory EsrbRating.fromJson(Map<String, dynamic> json) => EsrbRating(
        id: json["id"].toString(),
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class ParentPlatform {
  ParentPlatform({
    this.platform,
  });

  final EsrbRating? platform;

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => ParentPlatform(
        platform: json["platform"] == null
            ? null
            : EsrbRating.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
      };
}

class PlatformElement {
  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirements,
  });

  final PlatformPlatform? platform;
  final DateTime? releasedAt;
  final Requirements? requirements;

  factory PlatformElement.fromJson(Map<String, dynamic> json) =>
      PlatformElement(
        platform: json["platform"] == null
            ? null
            : PlatformPlatform.fromJson(json["platform"]),
        releasedAt: json["released_at"] == null
            ? null
            : DateTime.parse(json["released_at"]),
        requirements: json["requirements"] == null
            ? null
            : Requirements.fromJson(json["requirements"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
        "released_at":
            "${releasedAt!.year.toString().padLeft(4, '0')}-${releasedAt!.month.toString().padLeft(2, '0')}-${releasedAt!.day.toString().padLeft(2, '0')}",
        "requirements": requirements?.toJson(),
      };
}

class PlatformPlatform {
  PlatformPlatform({
    this.id,
    this.name,
    this.slug,
    this.image,
    this.yearEnd,
    this.yearStart,
    this.gamesCount,
    this.imageBackground,
  });

  final String? id;
  final String? name;
  final String? slug;
  final dynamic image;
  final dynamic yearEnd;
  final String? yearStart;
  final String? gamesCount;
  final String? imageBackground;

  factory PlatformPlatform.fromJson(Map<String, dynamic> json) =>
      PlatformPlatform(
        id: json["id"].toString(),
        name: json["name"],
        slug: json["slug"],
        image: json["image"],
        yearEnd: json["year_end"],
        yearStart: json["year_start"].toString(),
        gamesCount: json["games_count"].toString(),
        imageBackground: json["image_background"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
        "image": image,
        "year_end": yearEnd,
        "year_start": yearStart,
        "games_count": gamesCount,
        "image_background": imageBackground,
      };
}

class Requirements {
  Requirements({
    this.minimum,
  });

  final String? minimum;

  factory Requirements.fromJson(Map<String, dynamic> json) => Requirements(
        minimum: json["minimum"],
      );

  Map<String, dynamic> toJson() => {
        "minimum": minimum,
      };
}

class Reactions {
  Reactions();

  factory Reactions.fromJson(Map<String, dynamic> json) => Reactions();

  Map<String, dynamic> toJson() => {};
}

class Store {
  Store({
    this.id,
    this.url,
    this.store,
  });

  final String? id;
  final String? url;
  final Developer? store;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"].toString(),
        url: json["url"],
        store: json["store"] == null ? null : Developer.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "url": url,
        "store": store?.toJson(),
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
