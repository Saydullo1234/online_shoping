import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController cityController1 = TextEditingController(
    text: 'Gabriel Chapman',
  );
  final TextEditingController cityController =
      TextEditingController(text: '*** **** **** 5708');
  final TextEditingController postCodeController =
      TextEditingController(text: '06/23');
  final TextEditingController streetController =
      TextEditingController(text: '***');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Back',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(children: [
                Column(children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Shipping Adress',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontWeight: FontWeight.w600),
                        ),
                      ]),
                  Divider(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SingleChildScrollView(
                        child: SizedBox(height: 50, width: 100,
                            child: Image.network('assets/images/download.png')),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(height: 50, width: 100,
                            child: Image.network('assets/images/mastercard-og-image.png')),
                      ),
                      SingleChildScrollView(
                        child: SizedBox(height: 50, width: 100,
                            child: Image.network('assets/images/img_1.png')),
                      ),

                    ],
                  ),
                  SizedBox(height: 50),
                  const Text("Name",
                      style: TextStyle(color: Colors.black45)),
                  TextFormField(
                    controller: cityController1,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Card number",
                      style: TextStyle(color: Colors.black45)),
                  TextFormField(
                    controller: cityController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text("Expiry Date",
                      style: TextStyle(color: Colors.black45)),
                  TextFormField(
                    controller: postCodeController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  const SizedBox(height: 40),
                  const Text("CVC",
                      style: TextStyle(color: Colors.black45)),
                  TextFormField(
                    controller: streetController,
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  SizedBox(height: 180),
                  SizedBox(
                    height: 70,
                    width: 500,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.indigo,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ])
              ]))),
    );
  }
}
