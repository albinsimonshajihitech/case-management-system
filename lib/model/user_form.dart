/// UserdetailForm is a data class which stores data fields of Userdetail.
class UserdetailForm {
  String name;
  String age;
  String mobileNo;
  String email;

  UserdetailForm(this.name, this.age, this.mobileNo, this.email);

  factory UserdetailForm.fromJson(dynamic json) {
    return UserdetailForm("${json['name']}", "${json['age']}",
        "${json['mobileNo']}", "${json['email']}");
  }

  // Method to make GET parameters.
  Map toJson() => {
    'name': name,
    'age': age,
    'mobileNo': mobileNo,
    'email': email
  };
}