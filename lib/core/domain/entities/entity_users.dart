class Entity {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Entity({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Entity.fromMap(Map<String, dynamic> map) {
    return Entity(
      id: map['id'] ?? "",
      email: map['email'] ?? "",
      firstName: map['first_name'] ?? "",
      lastName: map['last_name'] ?? "",
      avatar: map['avatar'] ?? "",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}