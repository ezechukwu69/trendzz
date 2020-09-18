class IndividualTvseries {
  String backdropPath;
  List<CreatedBy> createdBy;
  List<int> episodeRunTime;
  String firstAirDate;
  List<Genres> genres;
  String homepage;
  double id;
  bool inProduction;
  List<String> languages;
  String lastAirDate;
  LastEpisodeToAir lastEpisodeToAir;
  String name;
  NextEpisodeToAir nextEpisodeToAir;
  List<Networks> networks;
  double numberOfEpisodes;
  double numberOfSeasons;
  List<String> originCountry;
  String originalLanguage;
  String originalName;
  String overview;
  double popularity;
  String posterPath;
  List<Networks> productionCompanies;
  List<Seasons> seasons;
  String status;
  String type;
  double voteAverage;
  double voteCount;

  IndividualTvseries(
      {this.backdropPath,
        this.createdBy,
        this.episodeRunTime,
        this.firstAirDate,
        this.genres,
        this.homepage,
        this.id,
        this.inProduction,
        this.languages,
        this.lastAirDate,
        this.lastEpisodeToAir,
        this.name,
        this.nextEpisodeToAir,
        this.networks,
        this.numberOfEpisodes,
        this.numberOfSeasons,
        this.originCountry,
        this.originalLanguage,
        this.originalName,
        this.overview,
        this.popularity,
        this.posterPath,
        this.productionCompanies,
        this.seasons,
        this.status,
        this.type,
        this.voteAverage,
        this.voteCount});

  IndividualTvseries.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      createdBy = new List<CreatedBy>();
      json['created_by'].forEach((v) {
        createdBy.add(new CreatedBy.fromJson(v));
      });
    }
    episodeRunTime = json['episode_run_time'].cast<int>();
    firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      genres = new List<Genres>();
      json['genres'].forEach((v) {
        genres.add(new Genres.fromJson(v));
      });
    }
    homepage = json['homepage'];
    id = json['id'] + 0.0;
    inProduction = json['in_production'];
    languages = json['languages'].cast<String>();
    lastAirDate = json['last_air_date'];
    lastEpisodeToAir = json['last_episode_to_air'] != null
        ? new LastEpisodeToAir.fromJson(json['last_episode_to_air'])
        : null;
    name = json['name'];
    nextEpisodeToAir = json['next_episode_to_air'] != null
        ? new NextEpisodeToAir.fromJson(json['next_episode_to_air'])
        : null;
    if (json['networks'] != null) {
      networks = new List<Networks>();
      json['networks'].forEach((v) {
        networks.add(new Networks.fromJson(v));
      });
    }
    numberOfEpisodes = json['number_of_episodes'] + 0.0;
    numberOfSeasons = json['number_of_seasons'] + 0.0;
    originCountry = json['origin_country'].cast<String>();
    originalLanguage = json['original_language'];
    originalName = json['original_name'];
    overview = json['overview'];
      popularity = json['popularity'];
    posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      productionCompanies = new List<Networks>();
      json['production_companies'].forEach((v) {
        productionCompanies.add(new Networks.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      seasons = new List<Seasons>();
      json['seasons'].forEach((v) {
        seasons.add(new Seasons.fromJson(v));
      });
    }
    status = json['status'];
    type = json['type'];
    voteAverage = json['vote_average'] + 0.0;
    voteCount = json['vote_count'] + 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    if (this.createdBy != null) {
      data['created_by'] = this.createdBy.map((v) => v.toJson()).toList();
    }
    data['episode_run_time'] = this.episodeRunTime;
    data['first_air_date'] = this.firstAirDate;
    if (this.genres != null) {
      data['genres'] = this.genres.map((v) => v.toJson()).toList();
    }
    data['homepage'] = this.homepage;
    data['id'] = this.id;
    data['in_production'] = this.inProduction;
    data['languages'] = this.languages;
    data['last_air_date'] = this.lastAirDate;
    if (this.lastEpisodeToAir != null) {
      data['last_episode_to_air'] = this.lastEpisodeToAir.toJson();
    }
    data['name'] = this.name;
    if (this.nextEpisodeToAir != null) {
      data['next_episode_to_air'] = this.nextEpisodeToAir.toJson();
    }
    if (this.networks != null) {
      data['networks'] = this.networks.map((v) => v.toJson()).toList();
    }
    data['number_of_episodes'] = this.numberOfEpisodes;
    data['number_of_seasons'] = this.numberOfSeasons;
    data['origin_country'] = this.originCountry;
    data['original_language'] = this.originalLanguage;
    data['original_name'] = this.originalName;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    if (this.productionCompanies != null) {
      data['production_companies'] =
          this.productionCompanies.map((v) => v.toJson()).toList();
    }
    if (this.seasons != null) {
      data['seasons'] = this.seasons.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['type'] = this.type;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class CreatedBy {
  double id;
  String creditId;
  String name;
  double gender;
  String profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  CreatedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'] + 0.0;
    creditId = json['credit_id'];
    name = json['name'];
    gender = json['gender'] + 0.0;
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['credit_id'] = this.creditId;
    data['name'] = this.name;
    data['gender'] = this.gender;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class Genres {
  double id;
  String name;

  Genres({this.id, this.name});

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'] + 0.0;
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

class LastEpisodeToAir {
  String airDate;
  double episodeNumber;
  double id;
  String name;
  String overview;
  String productionCode;
  double seasonNumber;
  double showId;
  String stillPath;
  double voteAverage;
  double voteCount;

  LastEpisodeToAir(
      {this.airDate,
        this.episodeNumber,
        this.id,
        this.name,
        this.overview,
        this.productionCode,
        this.seasonNumber,
        this.showId,
        this.stillPath,
        this.voteAverage,
        this.voteCount});

  LastEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'] + 0.0;
    id = json['id'] + 0.0;
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    seasonNumber = json['season_number'] + 0.0;
    showId = json['show_id'] + 0.0;
    stillPath = json['still_path'];
    voteAverage = json['vote_average'] + 0.0;
    voteCount = json['vote_count'] + 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class NextEpisodeToAir {
  String airDate;
  double episodeNumber;
  double id;
  String name;
  String overview;
  String productionCode;
  double seasonNumber;
  double showId;
  String stillPath;
  double voteAverage;
  double voteCount;

  NextEpisodeToAir(
      {this.airDate,
        this.episodeNumber,
        this.id,
        this.name,
        this.overview,
        this.productionCode,
        this.seasonNumber,
        this.showId,
        this.stillPath,
        this.voteAverage,
        this.voteCount});

  NextEpisodeToAir.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeNumber = json['episode_number'] + 0.0;
    id = json['id'] + 0.0;
    name = json['name'];
    overview = json['overview'];
    productionCode = json['production_code'];
    seasonNumber = json['season_number'] + 0.0;
    showId = json['show_id'] + 0.0;
    stillPath = json['still_path'];
    voteAverage = json['vote_average'] + 0.0;
    voteCount = json['vote_count'] + 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_number'] = this.episodeNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['production_code'] = this.productionCode;
    data['season_number'] = this.seasonNumber;
    data['show_id'] = this.showId;
    data['still_path'] = this.stillPath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }
}

class Networks {
  String name;
  double id;
  String logoPath;
  String originCountry;

  Networks({this.name, this.id, this.logoPath, this.originCountry});

  Networks.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'] + 0.0;
    logoPath = json['logo_path'];
    originCountry = json['origin_country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['logo_path'] = this.logoPath;
    data['origin_country'] = this.originCountry;
    return data;
  }
}

class Seasons {
  String airDate;
  double episodeCount;
  double id;
  String name;
  String overview;
  String posterPath;
  double seasonNumber;

  Seasons(
      {this.airDate,
        this.episodeCount,
        this.id,
        this.name,
        this.overview,
        this.posterPath,
        this.seasonNumber});

  Seasons.fromJson(Map<String, dynamic> json) {
    airDate = json['air_date'];
    episodeCount = json['episode_count'] + 0.0;
    id = json['id'] + 0.0;
    name = json['name'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    seasonNumber = json['season_number'] + 0.0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['air_date'] = this.airDate;
    data['episode_count'] = this.episodeCount;
    data['id'] = this.id;
    data['name'] = this.name;
    data['overview'] = this.overview;
    data['poster_path'] = this.posterPath;
    data['season_number'] = this.seasonNumber;
    return data;
  }
}
