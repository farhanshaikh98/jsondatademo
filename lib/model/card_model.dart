class Model {
  Model(
      {this.firstName,
      this.lastName,
      this.region,
      this.country,
      this.bio,
      this.post,
      this.followers,
      this.following,
      this.profilePic});

  String? firstName;
  String? lastName;
  String? region;
  String? country;
  String? bio;
  int? post;
  int? followers;
  int? following;
  String? profilePic;

  factory Model.fromJson(Map<String, dynamic> jsondata) {
    return Model(
      firstName: jsondata["first_name"],
      lastName: jsondata["last_name"],
      region: jsondata["region"],
      country: jsondata["country"],
      bio: jsondata["bio"],
      post: jsondata["post"],
      followers: jsondata["followers"],
      following: jsondata["following"],
      profilePic: jsondata["profile_pic"],
    );
  }
}
