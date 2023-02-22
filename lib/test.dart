class UserModel {
  final String name;
  final String id;
  final int age;

  UserModel(this.name, this.id, this.age);
}

List<UserModel> listOfUser = [];

test(UserModel model) {
  for (int i = 0; i < listOfUser.length; i++) {
    if (listOfUser[i].name != model.name) {
      listOfUser.add(model);
    }
  }
}
