class Data {
  Data({
    this.page,
    this.results,
  });

  final int? page;
  final List<Items>? results;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        page: json['page'],
        results: json["results"] == null
            ? null
            : List<Items>.from(json["results"].map((x) => Items.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": results == null
            ? null
            : List<dynamic>.from(results!.map((x) => x.toJson())),
      };
}

class Items {
  Items({
    this.name,
    this.firstAirDate,
    this.genre,
    this.id,
    this.title,
    this.originalTitle,
    this.popularity,
    this.overview,
    this.posterPath,
    this.voteCount,
    this.voteAverage,
    this.releaseDate,
  });

  final int? id;
  final String? title;
  final String? name;
  final String? originalTitle;
  final List<dynamic>? genre;
  final double? popularity;
  final String? overview;
  final String? posterPath;
  final int? voteCount;
  final double? voteAverage;
  final DateTime? releaseDate;
  final DateTime? firstAirDate;

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        title: json["title"],
        name: json["name"],
        originalTitle: json['original_title'],
        genre: json['genre_ids'],
        popularity: json["popularity"] is double
            ? json['popularity']
            : (json['popularity'] as int).toDouble(),
        overview: json['overview'],
        posterPath: json['poster_path'],
        voteCount: json['vote_count'],
        voteAverage: json['vote_average'] is double
            ? json['vote_average']
            : (json['vote_average'] as int).toDouble(),
        releaseDate: DateTime.tryParse(json['release_date'] ?? '0'),
        firstAirDate: DateTime.tryParse(json['first_air_date'] ?? '0'),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        'title': title,
        'name': name,
        'original_title': originalTitle,
        'genre_ids': genre,
        'popularity': popularity,
        'overview': overview,
        'poster_path': posterPath,
        'vote_count': voteCount,
        'vote_average': voteAverage,
        'release_date': releaseDate,
        'first_air_date': firstAirDate,
      };
}
