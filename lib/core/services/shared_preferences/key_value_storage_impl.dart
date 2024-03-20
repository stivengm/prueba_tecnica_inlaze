import 'package:shared_preferences/shared_preferences.dart';
import 'package:prueba_tecnica_inlaze/core/services/shared_preferences/key_value_storage.dart';

class KeyValueStorageImpl extends KeyValueStorageServices {

  Future<SharedPreferences> getSharedPreferences() async {
    return await SharedPreferences.getInstance();
  }
  
  @override
  Future<T?> getValue<T>(String key) async {

    final sharedPreferences = await getSharedPreferences();

    switch(T) {
      case int:
        return sharedPreferences.getInt(key) as T?;
      case String:
        return sharedPreferences.getString(key) as T?;
      default:
        throw UnimplementedError('Get not implemented for type ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final sharedPreferences = await getSharedPreferences();
    return await sharedPreferences.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {

    final sharedPreferences = await getSharedPreferences();

    switch(T) {
      case int:
        sharedPreferences.setInt(key, value as int);
        break;
      case String:
        sharedPreferences.setString(key, value as String);
        break;
      default:
        throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }

  }

}