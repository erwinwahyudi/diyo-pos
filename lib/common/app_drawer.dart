import 'package:diyo_pos/features/login/bloc/login_bloc.dart';
import 'package:diyo_pos/features/login/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        ListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(Icons.menu),
              Icon(Icons.keyboard_arrow_left_outlined),
            ],
          ),
          onTap: () => Navigator.pop(context),
        ),
        _drawerItem(
            icon: Icons.home,
            text: 'Home',
            onTap: () => debugPrint('Tap My Files')),
        // drawer with icon checklist
        _drawerItem(icon: Icons.checklist, text: 'Order Queue', onTap: () {}),

        _drawerItem(icon: Icons.apps, text: 'Menu', onTap: () {}),
        _drawerItem(
            icon: Icons.logout_outlined,
            text: 'Logout',
            onTap: () {
              context.read<LoginBloc>().add(DoLogout());
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                elevation: 8.0,
                behavior: SnackBarBehavior.floating,
                content: Text('Logged out'),
                backgroundColor: Colors.blue,
              ));
              context.go(LoginPage.routeName);
            }),
      ]),
    );
  }
}

Widget _drawerItem(
    {required IconData icon,
    required String text,
    required GestureTapCallback onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
