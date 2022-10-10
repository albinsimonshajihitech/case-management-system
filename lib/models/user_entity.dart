class UserEntity {
  final String name;
  final String age;
  final String phone;
  final String email;

  UserEntity({
    required this.name,
    required this.age,
    required this.phone,
    required this.email,
  });

  factory UserEntity.fromSheets(List<String> input) =>
      UserEntity(name: input[0], age: input[1], phone: input[2],email: input[3]);
}
