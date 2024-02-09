
import 'package:flutter/material.dart';
import 'package:otpless_flutter/otpless_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  

  @override
  
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final Otpless _otplessFlutterPlugin = Otpless();

  @override
  void initState() {
    super.initState();
    _openLoginPage();
  }

  void _openLoginPage() {
    var extra = {
      "method": "get",
      "params": {"cid": "LX01LZSL9MIFGXLEFXVDJS0X4379QG41"}
    };

    _otplessFlutterPlugin.openLoginPage((result) {
      var message = "";
      if (result['data'] != null) {
        final token = result['data']['token'];
        message = "token: $token";
      } else {
        message = result['errorMessage'];
      }
      // Handle the result here
    }, jsonObject: extra);
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          
          children: [
            Container(
              width: 400,
              height: 200,
              color: Colors.amber,
              child: Center(child: Text('Yello', style: TextStyle(fontSize: 25),))),
        
            Container(
              width: 400,
              height: 200,
              color: Colors.green,
              child: Center(child: Text("green" , style: TextStyle(fontSize: 25),)),
            ),
            Container(
              width: 400,
              height: 200,
              color: Colors.blue,
              child: Center(child: Text("blue" , style: TextStyle(fontSize: 25),)),
            ),
            Container(
              width: 400,
              height: 200,
              color: Colors.red,
              child: Center(child: Text("red" , style: TextStyle(fontSize: 25),)),
            )
          ],
        ),
      ) ,
      
         
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
