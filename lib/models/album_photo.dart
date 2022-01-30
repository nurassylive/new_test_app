class AlbumPhoto {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  AlbumPhoto({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  AlbumPhoto.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
