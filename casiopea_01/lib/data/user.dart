class User {
  final String email;
  final String password;

  User(this.email, this.password);
  
  static List<User> registeredUsers = [
    User('email1@example.com', '123'),
    User('email2@example.com', '123'),
  ];
}