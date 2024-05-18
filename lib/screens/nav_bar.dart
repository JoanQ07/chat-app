import 'package:chat_app/screens/history_chats.dart';
import 'package:flutter/material.dart';

class NavBarChat extends StatefulWidget {
  const NavBarChat({super.key});

  @override
  State<NavBarChat> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavBarChat> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(31, 13, 13, 13),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(31, 0, 0, 0),
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        indicatorColor: Colors.blueGrey.shade100,
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.message_rounded),
            label: 'Chats',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.person_add_alt),
            ),
            label: 'Amigos',
          ),
          NavigationDestination(
            icon: Badge(
              label: Text('2'),
              child: Icon(Icons.notification_add),
            ),
            label: 'Solicitudes',
          ),
        ],
      ),
      body: <Widget>[
        /// Home page
        const Card(
          color: Color.fromARGB(31, 13, 13, 13),
          child: ChatsHistory(),
        ),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Hablar con Joan'),
                  subtitle: Text('Fuera de linea'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.message),
                  title: Text('Hablar con Oscar'),
                  subtitle: Text('En linea'),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Solicitud de Camila'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Mensaje de Joan'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
      ][currentPageIndex],
    );
  }
}
