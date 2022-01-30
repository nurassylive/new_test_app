enum Endpoints {
  users,
  posts,
  comments,
  albums,
  photos,
}
// const String _baseURL = 'jsonplaceholder.typicode.com';
// const String _testURL = '$_baseURL/';

extension EndpointsExt on Endpoints {
  String get hostName => 'jsonplaceholder.typicode.com';

  String getPath() {
    switch (this) {
      case Endpoints.users:
        return '/users';
      case Endpoints.posts:
        return '/posts';
      case Endpoints.comments:
        return '/comments';
      case Endpoints.albums:
        return '/albums';
      case Endpoints.photos:
        return '/photos';
    }
  }

  String buildURL({Map<String, dynamic>? queryParameters}) {
    return Uri.https(
      hostName,
      getPath(),
      queryParameters,
    ).toString();
  }
}
