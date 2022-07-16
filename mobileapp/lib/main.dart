import 'package:flutter/material.dart';
import 'EmployerPage.dart';
import 'EmployerModel.dart';
import 'EmployeeModel.dart';
import 'package:provider/provider.dart';
import 'EmployeePage.dart';

var password;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EmployerModel(),
        ),
      ],
      child: MaterialApp(
        title: 'GPS Tracker Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Demo'),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _passwordController = TextEditingController();
  int _value = 1;
  String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "dApp\nGPS Tracker",
              style: TextStyle(
                fontSize: 50,
                color: Colors.indigo,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 10,
              ),
              child: DropdownButton(
                value: _value,
                items: [
                  DropdownMenuItem<int>(
                    child: Text("Employer"),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text("Employee"),
                    value: 2,
                  )
                ],
                onChanged: (value) {
                  setState(() {
                    _value = value as int;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 50,
                right: 50,
                bottom: 10,
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                ),
                cursorColor: Colors.black,
                decoration: const InputDecoration(
                  hintText: 'Input Password',
                  border: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
            Text("(Password must be 16 Characters)"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 1.3,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35.0),
                color: Colors.amber,
              ),
              child: MaterialButton(
                onPressed: () {
                  if (_passwordController.text.length == 16) {
                    if (_value == 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmployerPage(),
                        ),
                      );
                    } else if (_value == 2) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EmployeePage(),
                        ),
                      );
                    } else {
                      Text("Invalid User");
                    }
                    //print('Password: ' + _passwordController.text);
                    print('Secret Key: tadessekebedegug');
                    password = _passwordController.text;
                  } else {
                    setState(() {
                      error =
                          "Invalid length: \nPlease input 16 character secret password";
                    });
                  }
                },
                child: const Text('Login'),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red[900]),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
          ],
        ),
      ),
    );
  }
}
