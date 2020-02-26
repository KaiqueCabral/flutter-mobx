import 'package:project_flutter_mobx/models/user.model.dart';
import 'package:project_flutter_mobx/repositories/account.repository.dart';
import 'package:project_flutter_mobx/view-models/signup.viewmodel.dart';

class SignupController {
  AccountRepository repository;

  SignupController() {
    repository = new AccountRepository();
  }

  Future<UserModel> create(SignupViewModel model) async {
    model.isBusy = true;
    var user = await repository.createAccount(model);
    model.isBusy = false;
    return user;
  }
}
