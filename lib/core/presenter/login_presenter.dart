import 'package:prueba_tecnica_inlaze/core/services/shared_preferences/key_value_storage_impl.dart';
import 'package:prueba_tecnica_inlaze/gui/views/login_view/login_viewmodel.dart';

class LoginPresenter {

  final LoginViewModel _view;
  final keyValueStorageImpl = KeyValueStorageImpl();

  LoginPresenter(this._view);

  void setLoggedUser( String email, String password ) async {
    print("Email: $email  Y Password: $password");
    try {
      await keyValueStorageImpl.setKeyValue('test_email', email);

      _view.sendLogin();
    } catch (e) {
      _view.showError();
    }

  }

  void logout() async {
    await keyValueStorageImpl.removeKey('test_email');
  }
  
}