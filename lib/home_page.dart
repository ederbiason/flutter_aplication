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
  final list = <String>[];
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://reservatoriodedopamina.com.br/wp-content/uploads/2022/08/Logo-RD.png',
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: Colors.black.withOpacity(.5),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                FlutterLogo(size: 150,)
              ]
            ),
          ),
        ],
      ),
      )
    );
  }
}
