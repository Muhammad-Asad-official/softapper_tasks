

class User {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String cnicNumber;
  final String emergencyContact;

  User({
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.address,
    required this.cnicNumber,
    required this.emergencyContact,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      address: json['address'],
      cnicNumber: json['cnicNumber'],
      emergencyContact: json['emergencyContact'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'address': address,
      'cnicNumber': cnicNumber,
      'emergencyContact': emergencyContact,
    };
  }

}
