// To parse this JSON data, do
//
//     final gameModel = gameModelFromJson(jsonString);

import 'dart:convert';

GameModel gameModelFromJson(String str) => GameModel.fromJson(json.decode(str));

String gameModelToJson(GameModel data) => json.encode(data.toJson());

class GameModel {
  GameModel({
    this.count,
    this.next,
    this.previous,
    this.results,
    this.userPlatforms,
  });

  final int? count;
  final String? next;
  final dynamic previous;
  final List<Result>? results;
  final bool? userPlatforms;

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map((x) => Result.fromJson(x))),
        userPlatforms: json["user_platforms"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(results!.map((x) => x.toJson())),
        "user_platforms": userPlatforms,
      };
}

class Result {
  Result({
    this.slug,
    this.name,
    this.playtime,
    this.platforms,
    this.stores,
    this.released,
    this.tba,
    this.backgroundImage,
    this.rating,
    this.ratingTop,
    this.ratings,
    this.ratingsCount,
    this.reviewsTextCount,
    this.added,
    this.addedByStatus,
    this.metacritic,
    this.suggestionsCount,
    this.updated,
    this.id,
    this.score,
    this.clip,
    this.tags,
    this.esrbRating,
    this.userGame,
    this.reviewsCount,
    this.communityRating,
    this.saturatedColor,
    this.dominantColor,
    this.shortScreenshots,
    this.parentPlatforms,
    this.genres,
  });

  final String? slug;
  final String? name;
  final int? playtime;
  final List<Platform>? platforms;
  final dynamic stores;
  final DateTime? released;
  final bool? tba;
  final String? backgroundImage;
  final int? rating;
  final int? ratingTop;
  final List<Rating>? ratings;
  final int? ratingsCount;
  final int? reviewsTextCount;
  final int? added;
  final AddedByStatus? addedByStatus;
  final dynamic metacritic;
  final int? suggestionsCount;
  final DateTime? updated;
  final int? id;
  final dynamic score;
  final dynamic clip;
  final List<dynamic>? tags;
  final dynamic esrbRating;
  final dynamic userGame;
  final int? reviewsCount;
  final int? communityRating;
  final String? saturatedColor;
  final String? dominantColor;
  final List<ShortScreenshot>? shortScreenshots;
  final List<Platform>? parentPlatforms;
  final List<Genre>? genres;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        name: json["name"],
        playtime: json["playtime"],
        platforms: json["platforms"] == null
            ? []
            : List<Platform>.from(
                json["platforms"]!.map((x) => Platform.fromJson(x))),
        stores: json["stores"],
        released:
            json["released"] == null ? null : DateTime.parse(json["released"]),
        tba: json["tba"],
        backgroundImage: json["background_image"],
        rating: json["rating"],
        ratingTop: json["rating_top"],
        ratings: json["ratings"] == null
            ? []
            : List<Rating>.from(
                json["ratings"]!.map((x) => Rating.fromJson(x))),
        ratingsCount: json["ratings_count"],
        reviewsTextCount: json["reviews_text_count"],
        added: json["added"],
        addedByStatus: json["added_by_status"] == null
            ? null
            : AddedByStatus.fromJson(json["added_by_status"]),
        metacritic: json["metacritic"],
        suggestionsCount: json["suggestions_count"],
        updated:
            json["updated"] == null ? null : DateTime.parse(json["updated"]),
        id: json["id"],
        score: json["score"],
        clip: json["clip"],
        tags: json["tags"] == null
            ? []
            : List<dynamic>.from(json["tags"]!.map((x) => x)),
        esrbRating: json["esrb_rating"],
        userGame: json["user_game"],
        reviewsCount: json["reviews_count"],
        communityRating: json["community_rating"],
        saturatedColor: json["saturated_color"],
        dominantColor: json["dominant_color"],
        shortScreenshots: json["short_screenshots"] == null
            ? []
            : List<ShortScreenshot>.from(json["short_screenshots"]!
                .map((x) => ShortScreenshot.fromJson(x))),
        parentPlatforms: json["parent_platforms"] == null
            ? []
            : List<Platform>.from(
                json["parent_platforms"]!.map((x) => Platform.fromJson(x))),
        genres: json["genres"] == null
            ? []
            : List<Genre>.from(json["genres"]!.map((x) => Genre.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "name": name,
        "playtime": playtime,
        "platforms": platforms == null
            ? []
            : List<dynamic>.from(platforms!.map((x) => x.toJson())),
        "stores": stores,
        "released":
            "${released!.year.toString().padLeft(4, '0')}-${released!.month.toString().padLeft(2, '0')}-${released!.day.toString().padLeft(2, '0')}",
        "tba": tba,
        "background_image": backgroundImage,
        "rating": rating,
        "rating_top": ratingTop,
        "ratings": ratings == null
            ? []
            : List<dynamic>.from(ratings!.map((x) => x.toJson())),
        "ratings_count": ratingsCount,
        "reviews_text_count": reviewsTextCount,
        "added": added,
        "added_by_status": addedByStatus?.toJson(),
        "metacritic": metacritic,
        "suggestions_count": suggestionsCount,
        "updated": updated?.toIso8601String(),
        "id": id,
        "score": score,
        "clip": clip,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "esrb_rating": esrbRating,
        "user_game": userGame,
        "reviews_count": reviewsCount,
        "community_rating": communityRating,
        "saturated_color": saturatedColor,
        "dominant_color": dominantColor,
        "short_screenshots": shortScreenshots == null
            ? []
            : List<dynamic>.from(shortScreenshots!.map((x) => x.toJson())),
        "parent_platforms": parentPlatforms == null
            ? []
            : List<dynamic>.from(parentPlatforms!.map((x) => x.toJson())),
        "genres": genres == null
            ? []
            : List<dynamic>.from(genres!.map((x) => x.toJson())),
      };
}

class AddedByStatus {
  AddedByStatus({
    this.yet,
    this.owned,
    this.toplay,
  });

  final int? yet;
  final int? owned;
  final int? toplay;

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => AddedByStatus(
        yet: json["yet"],
        owned: json["owned"],
        toplay: json["toplay"],
      );

  Map<String, dynamic> toJson() => {
        "yet": yet,
        "owned": owned,
        "toplay": toplay,
      };
}

class Genre {
  Genre({
    this.id,
    this.name,
    this.slug,
  });

  final int? id;
  final String? name;
  final String? slug;

  factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "slug": slug,
      };
}

class Platform {
  Platform({
    this.platform,
  });

  final Genre? platform;

  factory Platform.fromJson(Map<String, dynamic> json) => Platform(
        platform:
            json["platform"] == null ? null : Genre.fromJson(json["platform"]),
      );

  Map<String, dynamic> toJson() => {
        "platform": platform?.toJson(),
      };
}

class Rating {
  Rating({
    this.id,
    this.title,
    this.count,
    this.percent,
  });

  final int? id;
  final String? title;
  final int? count;
  final int? percent;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        id: json["id"],
        title: json["title"],
        count: json["count"],
        percent: json["percent"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "count": count,
        "percent": percent,
      };
}

class ShortScreenshot {
  ShortScreenshot({
    this.id,
    this.image,
  });

  final int? id;
  final String? image;

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) =>
      ShortScreenshot(
        id: json["id"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
      };
}
