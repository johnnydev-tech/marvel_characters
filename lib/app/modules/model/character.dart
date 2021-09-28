// To parse required this JSON data, do
//
//     final character = characterFromJson(jsonString);

import 'dart:convert';

CharacterModel characterFromJson(String str) =>
    CharacterModel.fromJson(json.decode(str));

String characterToJson(CharacterModel data) => json.encode(data.toJson());

class CharacterModel {
  CharacterModel({
    required this.id,
    required this.name,
    required this.description,
    required this.modified,
    required this.resourceUri,
    required this.urls,
    required this.thumbnail,
    required this.comics,
    required this.stories,
    required this.events,
    required this.series,
  });

  final int id;
  final String name;
  final String description;
  final String modified;
  final String resourceUri;
  final List<Url> urls;
  final Thumbnail thumbnail;
  final Comics comics;
  final Stories stories;
  final Comics events;
  final Comics series;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        modified: json['modified'],
        resourceUri: json['resourceURI'],
        urls: List<Url>.from(json['urls'].map((x) => Url.fromJson(x))),
        thumbnail: Thumbnail.fromJson(json['thumbnail']),
        comics: Comics.fromJson(json['comics']),
        stories: Stories.fromJson(json['stories']),
        events: Comics.fromJson(json['events']),
        series: Comics.fromJson(json['series']),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'modified': modified,
        'resourceURI': resourceUri,
        'urls': List<dynamic>.from(urls.map((x) => x.toJson())),
        'thumbnail': thumbnail.toJson(),
        'comics': comics.toJson(),
        'stories': stories.toJson(),
        'events': events.toJson(),
        'series': series.toJson(),
      };
}

class Comics {
  Comics({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionUri;
  final List<ComicsItem> items;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<ComicsItem>.from(
            json['items'].map((x) => ComicsItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class ComicsItem {
  ComicsItem({
    required this.resourceUri,
    required this.name,
  });

  String resourceUri;
  String name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
      };
}

class Stories {
  Stories({
    required this.available,
    required this.returned,
    required this.collectionUri,
    required this.items,
  });

  final int available;
  final int returned;
  final String collectionUri;
  final List<StoriesItem> items;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json['available'],
        returned: json['returned'],
        collectionUri: json['collectionURI'],
        items: List<StoriesItem>.from(
            json['items'].map((x) => StoriesItem.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        'available': available,
        'returned': returned,
        'collectionURI': collectionUri,
        'items': List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class StoriesItem {
  StoriesItem({
    required this.resourceUri,
    required this.name,
    required this.type,
  });

  final String resourceUri;
  final String name;
  final String type;

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json['resourceURI'],
        name: json['name'],
        type: json['type'],
      );

  Map<String, dynamic> toJson() => {
        'resourceURI': resourceUri,
        'name': name,
        'type': type,
      };
}

class Thumbnail {
  Thumbnail({
    required this.path,
    required this.extension,
  });

  final String path;
  final String extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json['path'],
        extension: json['extension'],
      );

  Map<String, dynamic> toJson() => {
        'path': path,
        'extension': extension,
      };
}

class Url {
  Url({
    required this.type,
    required this.url,
  });

  final String type;
  final String url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json['type'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'type': type,
        'url': url,
      };
}
