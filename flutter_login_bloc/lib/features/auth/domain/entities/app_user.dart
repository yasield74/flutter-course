class AppUser {
  final String uid;
  final String email;
  

  AppUser({
    required this.uid,
    required this.email,

  });

  //convert to map

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      uid: json['uid'],
      email: json['email'],
    );
  }
}