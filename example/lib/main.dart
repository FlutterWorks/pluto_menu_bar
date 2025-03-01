// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:pluto_menu_bar/pluto_menu_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('PlutoMenuBar'),
        ),
        body: const PlutoMenuBarDemo(),
      ),
    );
  }
}

class PlutoMenuBarDemo extends StatelessWidget {
  const PlutoMenuBarDemo({
    super.key,
  });

  void message(context, String text) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    final snackBar = SnackBar(
      content: Text(text),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<PlutoMenuItem> getMenus(BuildContext context) {
    return [
      PlutoMenuItem(
        title: 'Menu 1',
        icon: Icons.home,
        children: [
          PlutoMenuItem(
            title: 'Menu 1-1',
            icon: Icons.group,
            onTap: () => message(context, 'Menu 1-1 tap'),
            children: [
              PlutoMenuItem(
                title: 'Menu 1-1-1',
                onTap: () => message(context, 'Menu 1-1-1 tap'),
                children: [
                  PlutoMenuItem(
                    title: 'Menu 1-1-1-1',
                    onTap: () => message(context, 'Menu 1-1-1-1 tap'),
                  ),
                  PlutoMenuItem(
                    title: 'Menu 1-1-1-2',
                    onTap: () => message(context, 'Menu 1-1-1-2 tap'),
                  ),
                ],
              ),
              PlutoMenuItem(
                title: 'Menu 1-1-2',
                onTap: () => message(context, 'Menu 1-1-2 tap'),
              ),
            ],
          ),
          PlutoMenuItem(
            title: 'Menu 1-2',
            onTap: () => message(context, 'Menu 1-2 tap'),
          ),
          PlutoMenuItem.divider(height: 10),
          PlutoMenuItem.checkbox(
            title: 'Menu 1-3',
            initialCheckValue: true,
            // onTap: () => message(context, 'Menu 1-3 tap'),
            onChanged: (flag) => print(flag),
          ),
          PlutoMenuItem.divider(height: 10),
          PlutoMenuItem.radio(
            title: 'Menu 1-3',
            initialRadioValue: _RadioItems.one,
            radioItems: _RadioItems.values,
            // onTap: () => message(context, 'Menu 1-3 tap'),
            onChanged: (item) => print(item),
            getTitle: (item) {
              switch (item as _RadioItems) {
                case _RadioItems.one:
                  return 'One';
                case _RadioItems.two:
                  return 'Two';
                case _RadioItems.three:
                  return 'Three';
              }
            },
          ),
          PlutoMenuItem(
            title: 'Menu 1-4',
            icon: Icons.group,
            onTap: () => message(context, 'Menu 1-4 tap'),
            children: [
              PlutoMenuItem(
                title: 'Menu 1-4-1',
                onTap: () => message(context, 'Menu 1-4-1 tap'),
                children: [
                  PlutoMenuItem(
                    title: 'Menu 1-4-1-1',
                    onTap: () => message(context, 'Menu 1-4-1-1 tap'),
                  ),
                  PlutoMenuItem(
                    title: 'Menu 1-4-1-2',
                    onTap: () => message(context, 'Menu 1-4-1-2 tap'),
                  ),
                ],
              ),
              PlutoMenuItem(
                title: 'Menu 1-4-2',
                onTap: () => message(context, 'Menu 1-4-2 tap'),
              ),
            ],
          ),
        ],
      ),
      PlutoMenuItem(
        title: 'Menu 2',
        icon: Icons.add_circle,
        children: [
          PlutoMenuItem(
            title: 'Menu 2-1',
            onTap: () => message(context, 'Menu 2-1 tap'),
          ),
        ],
      ),
      PlutoMenuItem(
        title: 'Menu 3',
        icon: Icons.apps_outlined,
        onTap: () => message(context, 'Menu 3 tap'),
      ),
      PlutoMenuItem(
        title: 'Menu 4',
        onTap: () => message(context, 'Menu 4 tap'),
      ),
      PlutoMenuItem(
        title: 'Menu 5',
        onTap: () => message(context, 'Menu 5 tap'),
      ),
      PlutoMenuItem(
        title: 'Menu 6',
        children: [
          PlutoMenuItem(
            title: 'Menu 6-1',
            onTap: () => message(context, 'Menu 6-1 tap'),
            children: [
              PlutoMenuItem(
                title: 'Menu 6-1-1',
                onTap: () => message(context, 'Menu 6-1-1 tap'),
                children: [
                  PlutoMenuItem(
                    title: 'Menu 6-1-1-1',
                    onTap: () => message(context, 'Menu 6-1-1-1 tap'),
                  ),
                  PlutoMenuItem(
                    title: 'Menu 6-1-1-2',
                    onTap: () => message(context, 'Menu 6-1-1-2 tap'),
                  ),
                ],
              ),
              PlutoMenuItem(
                title: 'Menu 6-1-2',
                onTap: () => message(context, 'Menu 6-1-2 tap'),
              ),
            ],
          ),
          PlutoMenuItem(
            title: 'Menu 6-2',
            onTap: () => message(context, 'Menu 6-2 tap'),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const Text('Hover-open Menu', style: TextStyle(fontSize: 30)),
          const Text('Works normally in an environment with a mouse.'),
          const SizedBox(height: 30),
          PlutoMenuBar(
            mode: PlutoMenuBarMode.hover,
            menus: getMenus(context),
          ),
          const SizedBox(height: 30),
          PlutoMenuBar(
            mode: PlutoMenuBarMode.hover,
            backgroundColor: Colors.deepOrange,
            activatedColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            textStyle: const TextStyle(color: Colors.white),
            menuIconColor: Colors.white,
            moreIconColor: Colors.white,
            menus: getMenus(context),
          ),
          const SizedBox(height: 30),
          const Text('Tap-open Menu', style: TextStyle(fontSize: 30)),
          const SizedBox(height: 30),
          PlutoMenuBar(
            mode: PlutoMenuBarMode.tap,
            menus: getMenus(context),
          ),
          const SizedBox(height: 30),
          PlutoMenuBar(
            backgroundColor: Colors.deepOrange,
            activatedColor: Colors.white,
            indicatorColor: Colors.deepOrange,
            textStyle: const TextStyle(color: Colors.white),
            menuIconColor: Colors.white,
            moreIconColor: Colors.white,
            menus: getMenus(context),
          ),
        ],
      ),
    );
  }
}

enum _RadioItems {
  one,
  two,
  three,
}
