import 'package:flutter/material.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeAssignment(),
    );
  }
}

class HomeAssignment extends StatefulWidget {
  const HomeAssignment({Key? key}) : super(key: key);

  @override
  State<HomeAssignment> createState() => _HomeAssignmentState();
}

class _HomeAssignmentState extends State<HomeAssignment> {
  late int _count;

  @override
  void initState() {
    super.initState();
    _count = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Counter",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.lightBlueAccent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Tap \"-\" to decrement",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Theme.of(context).colorScheme.outline,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => setState(
                      () => {
                        if (_count <= 0)
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Number is below positive "),
                                  backgroundColor: Colors.red),
                            ),
                          }
                        else
                          {_count--}
                      },
                    ),
                    icon: const Icon(Icons.remove),
                  ),
                  Text(
                    "$_count",
                    style: const TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () => setState(() => _count++),
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            const Text(
              "Tap \"+\" to increment",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyStateWidget extends StatefulWidget {
  const MyStateWidget({Key? key}) : super(key: key);

  @override
  State<MyStateWidget> createState() => _MyStateWidgetState();
}

class _MyStateWidgetState extends State<MyStateWidget> {
  late int _couter;

  @override
  void initState() {
    super.initState();
    _couter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: IconButton(
        //   icon: const Icon(Icons.menu),
        //   onPressed: () {},
        // ),
        title: const Text("Counter"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add_alert),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("This is shown by actions")),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add_alarm),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("This is shown by actions"),
                  duration: Duration(seconds: 1),
                ),
              );
            },
          ),
          PopupMenuButton(
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  child: Icon(Icons.menu),
                ),
              ];
            },
          )
        ],
      ),
      drawer: const Drawer(
        child: SingleChildScrollView(
          child: SafeArea(
            child: AboutListTile(
              icon: Icon(Icons.info),
              applicationIcon: FlutterLogo(),
              applicationName: 'Show About Example',
              applicationVersion: 'August 2019',
              applicationLegalese: '\u{a9} 2014 The Flutter Authors',
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        color: Colors.black12,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text("Counter:"),
            Text(_couter.toString()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _couter++;
        }),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class LessonOneWidget extends StatelessWidget {
  const LessonOneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        title: const Text("App Titles"),
        backgroundColor: Colors.green,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ),
      body: const Center(
        child: Text(
          "Hello world",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.plus_one),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "New"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
