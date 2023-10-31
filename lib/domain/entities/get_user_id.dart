import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserId {
  String userId;
  String name;
  String gender;
  UserId({
    required this.userId,
    required this.name,
    required this.gender,
  });

  UserId copyWith({
    String? userId,
    String? name,
    String? gender,
  }) {
    return UserId(
      userId: userId ?? this.userId,
      name: name ?? this.name,
      gender: gender ?? this.gender,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userId': userId,
      'name': name,
      'gender': gender,
    };
  }

  factory UserId.fromMap(Map<String, dynamic> map) {
    return UserId(
      userId: map['userId'] as String,
      name: map['name'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserId.fromJson(String source) => UserId.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'UserId(userId: $userId, name: $name, gender: $gender)';

  @override
  bool operator ==(covariant UserId other) {
    if (identical(this, other)) return true;
  
    return 
      other.userId == userId &&
      other.name == name &&
      other.gender == gender;
  }

  @override
  int get hashCode => userId.hashCode ^ name.hashCode ^ gender.hashCode;
}
