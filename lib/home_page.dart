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
      appBar: AppBar(
        title: Text("Home")
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.red,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.blue,
            ),
            Container(
              width: 80,
              height: 80,
              color: Colors.green,
            ),
          ],
        )
      ),
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
