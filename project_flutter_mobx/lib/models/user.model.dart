class UserModel {
  late String id;
  late String name;
  late String email;
  late String picture;
  late String role;
  late String token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.picture,
    required this.role,
    required this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    picture = json['picture'];
    role = json['role'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['picture'] = this.picture;
    data['role'] = this.role;
    data['token'] = this.token;
    return data;
  }
}
