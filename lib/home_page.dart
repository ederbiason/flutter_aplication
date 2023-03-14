import 'package:flutter/material.dart';
import 'package:flutter_aplication/home_controller.dart';

// class HomePage extends StatelessWidget {
//   const HomePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var controller = HomeController.of(context);
//     final size = MediaQuery.of(context).size;
//     final navigation = Navigator.of(context);
//     final theme = Theme.of(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Home")
//       ),
//       body: Center(
//         child: Text('Salve ${controller.value}')
//       ),
//       floatingActionButton: FloatingActionButton(
//         child: Icon(Icons.add),
//         onPressed: () {
//           controller.increment();
//         },
//       ),
//     );
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (var i = 0; i < 10; i++)
                  Container(
                    width: double.infinity,
                    height: 80,
                    margin: EdgeInsets.all(8),
                    color: Colors.red,
                  ),
              ],
          ))),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
      ),
    );
  }
}
