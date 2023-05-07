import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference extends StatefulWidget {
  const SharedPreference({super.key, required this.title});

  final String title;

  @override
  State<SharedPreference> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<SharedPreference> {
  //
  //
  //
  // int? age;
  // String name = '';
  // double? luckyNum;

  @override
  void initState() {
    super.initState();
    // isLogin();
  }

  // void isLogin() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   age = sp.getInt('age') as int;
  //   name = sp.getString('name') ?? '';
  //   luckyNum = sp.getDouble('luckyNum') as double;
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: mySharedPreference(),
      floatingActionButton: myFloatingActionButton(),
    );
  }

  Widget mySharedPreference() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FutureBuilder(
            future: SharedPreferences.getInstance(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  Text(snapshot.data!.getString('name').toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data!.getInt('age').toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data!.getDouble('luckyNum').toString()),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(snapshot.data!.getBool('bool').toString()),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget myFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () async {
        SharedPreferences sp = await SharedPreferences.getInstance();

        sp.setString('name', 'Imran ');
        sp.setInt('age', 22);
        sp.setDouble('luckyNum', 10.10);

        sp.setBool('bool', true);

        //sp.remove('age');
        //sp.remove('name');
        // sp.remove('luckyNum');

        // age = sp.getInt('age') as int;
        // name = sp.getString('name') ?? '';
        // luckyNum = sp.getInt('luckyNum') as double;

        setState(() {});
      },
      child: const Icon(Icons.add),
    );
  }
}
