import 'dart:convert';

import 'package:fish_app/models/artwork.dart';

class NowPlayingArtworks {
    final Pagination pagination;
    final List<Artwork> data;
    final Info info;
    final Config config;

    NowPlayingArtworks({
        required this.pagination,
        required this.data,
        required this.info,
        required this.config,
    });

    factory NowPlayingArtworks.fromJson(String str) => NowPlayingArtworks.fromMap(json.decode(str));
    
    String toJson() => json.encode(toMap());

    factory NowPlayingArtworks.fromMap(Map<String, dynamic> json) => NowPlayingArtworks(
        pagination: Pagination.fromMap(json["pagination"]),
        data: List<Artwork>.from(json["data"].map((x) => Artwork.fromMap(x))),
        info: Info.fromMap(json["info"]),
        config: Config.fromMap(json["config"]),
    );

    Map<String, dynamic> toMap() => {
        "pagination": pagination.toMap(),
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "info": info.toMap(),
        "config": config.toMap(),
    };
}

class Config {
    final String iiifUrl;
    final String websiteUrl;

    Config({
        required this.iiifUrl,
        required this.websiteUrl,
    });

    factory Config.fromJson(String str) => Config.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Config.fromMap(Map<String, dynamic> json) => Config(
        iiifUrl: json["iiif_url"],
        websiteUrl: json["website_url"],
    );

    Map<String, dynamic> toMap() => {
        "iiif_url": iiifUrl,
        "website_url": websiteUrl,
    };
}



class Info {
    final String licenseText;
    final List<String> licenseLinks;
    final String version;

    Info({
        required this.licenseText,
        required this.licenseLinks,
        required this.version,
    });

    factory Info.fromJson(String str) => Info.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Info.fromMap(Map<String, dynamic> json) => Info(
        licenseText: json["license_text"],
        licenseLinks: List<String>.from(json["license_links"].map((x) => x)),
        version: json["version"],
    );

    Map<String, dynamic> toMap() => {
        "license_text": licenseText,
        "license_links": List<dynamic>.from(licenseLinks.map((x) => x)),
        "version": version,
    };
}

class Pagination {
    final int total;
    final int limit;
    final int offset;
    final int totalPages;
    final int currentPage;
    final String nextUrl;

    Pagination({
        required this.total,
        required this.limit,
        required this.offset,
        required this.totalPages,
        required this.currentPage,
        required this.nextUrl,
    });

    factory Pagination.fromJson(String str) => Pagination.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Pagination.fromMap(Map<String, dynamic> json) => Pagination(
        total: json["total"],
        limit: json["limit"],
        offset: json["offset"],
        totalPages: json["total_pages"],
        currentPage: json["current_page"],
        nextUrl: json["next_url"],
    );

    Map<String, dynamic> toMap() => {
        "total": total,
        "limit": limit,
        "offset": offset,
        "total_pages": totalPages,
        "current_page": currentPage,
        "next_url": nextUrl,
    };
}
