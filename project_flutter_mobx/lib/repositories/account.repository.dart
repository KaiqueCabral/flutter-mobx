import 'package:project_flutter_mobx/models/user.model.dart';
import 'package:project_flutter_mobx/view-models/signup.viewmodel.dart';

class AccountRepository {
  Future<UserModel> createAccount(SignupViewModel model) async {
    await Future.delayed(Duration(milliseconds: 300)); //Simulating API
    return new UserModel(
      id: "1",
      name: "Kaique Cabral",
      email: "contact@kaiquecabral.com",
      picture: "https://placehold.it/400",
      role: "Student",
      token: "flutter_mobx_signup",
    );
  }
}
