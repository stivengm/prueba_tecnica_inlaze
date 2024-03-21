import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/services/shared_preferences/key_value_storage_impl.dart';
import 'package:prueba_tecnica_inlaze/gui/widgets/primary_button.dart';

class HomeDrawer extends StatefulWidget {

  final GlobalKey<ScaffoldState> scaffoldKey;


  const HomeDrawer({super.key, required this.scaffoldKey});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {

  late String emailSharedPreferences = '';
  late String passwordSharedPreferences = '';

  int navDrawerIndex = 0;

  @override
  void initState() {
    super.initState();
    getSharedPreferences();
  }

  getSharedPreferences() async {
    final keyValueStorageImpl = KeyValueStorageImpl();
    emailSharedPreferences = await keyValueStorageImpl.getValue<String>('email') as String;
    passwordSharedPreferences = await keyValueStorageImpl.getValue<String>('password') as String;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 13.0, horizontal: 15.0),
        child: Column(
          children: [
            const DrawerHeader(
              child: CircleAvatar(
                radius: 60.0,
                backgroundColor: Color(0xFF778899),
                backgroundImage: AssetImage("assets/user.webp"),
              ),
            ),
            const SizedBox(height: 15.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Email: $emailSharedPreferences"),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.0),
                    child: Divider(),
                  ),
                  Text("Password: $passwordSharedPreferences")
                ],
              ),
            ),
            SizedBox(
              child: PrimaryButton(
                text: 'Cerrar sesión',
                onPressed: () => logout(context)
              ),
            )
          ],
        ),
      ),
    );
  }

  logout(context) async  {
    final keyValueStorageImpl = KeyValueStorageImpl();
    await keyValueStorageImpl.removeKey('email');
    await keyValueStorageImpl.removeKey('password');
    Navigator.of(context).pushNamedAndRemoveUntil('login', (route) => false);
  }

}