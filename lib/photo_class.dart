//سهام فوال

class Photo {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;


  const Photo({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  });

   //زهراء حليوة  
   factory Photo.fromJSON(Map<String, dynamic> map)
  {
    return Photo(
        albumId: map['albumId'],
        id: map['id'],
        title: map['title'],
        url: map['url'],
        thumbnailUrl: map['thumbnailUrl']
    );
  }
}