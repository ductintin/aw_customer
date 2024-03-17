
class RegisterRequest {
  late String name;
  late String email;
  late String password;
  late String phone;

  RegisterRequest({required this.name, required this.email, required this.password, required this.phone});

  factory RegisterRequest.fromJson(Map<String, dynamic> data) => RegisterRequest(
      name : data['name'],
      email : data['email'],
      password : data['password'],
      phone : data['phone']);


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['email'] = email;
    map['password'] = password;
    map['phone'] = phone;
    return map;
  }

}