import 'package:flutter/material.dart';
import 'package:prueba_tecnica_inlaze/core/services/shared_preferences/key_value_storage_impl.dart';

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
    // TODO: implement initState
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
    return NavigationDrawer(
      selectedIndex: navDrawerIndex,
      onDestinationSelected: (value) {
        setState(() {
          navDrawerIndex = value;
        });

        Navigator.pop(context);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [

        Container(
          height: 200.0,
          width: 100.0,
          decoration: const BoxDecoration(
            color: Colors.grey,
            // borderRadius: BorderRadius.circular(100)
          ),
        ),
        const SizedBox(height: 10.0),

        Text(emailSharedPreferences),

        const Padding(
          padding: EdgeInsets.fromLTRB(28, 16, 28, 10),
          child: Divider(),
        ),
                
        
      ]
    );
  }
}