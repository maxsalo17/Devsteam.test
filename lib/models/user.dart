class UserModel{
  String id;
  String username;
  String name;
  String firstName;
  String lastName;

  UserModel({this.id, this.username, this.name, this.firstName, this.lastName});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      username: json['username'],
      name: json['name'],
      firstName: json['first_name'],
      lastName: json['last_name']
    );
  }
}