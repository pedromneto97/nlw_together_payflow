class User {
  final String name;
  final String email;
  final String id;
  final String photoUrl;

  const User({
    required this.name,
    required this.email,
    required this.id,
    required this.photoUrl,
  });

  Map<String, String> toMap() {
    return {
      'name': name,
      'email': email,
      'id': id,
      'photoUrl': photoUrl,
    };
  }

  User.fromMap(Map<String, dynamic> user)
      : assert(user['name'] != null),
        assert(user['email'] != null),
        assert(user['id'] != null),
        assert(user['photoUrl'] != null),
        name = user['name']!,
        email = user['email']!,
        id = user['id']!,
        photoUrl = user['photoUrl']!;
}
