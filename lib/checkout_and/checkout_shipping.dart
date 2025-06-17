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
  String selectedCountry = 'Germany';
  final List<String> countries =['Germany', 'France', 'USA', 'Uzbekistan'];
  final TextEditingController cityController = TextEditingController(text: 'Berlin');
  final TextEditingController postCodeController = TextEditingController(text: '10114');
  final TextEditingController streetController = TextEditingController(text: 'SchinkenstraBe 35');

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
                      ]
                  ),
                  Divider(
                    height: 50,
                  ),
                  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Country", style: TextStyle(color: Colors.grey)),
                DropdownButtonFormField<String>(
                  value: selectedCountry,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                  items: countries.map((String country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountry = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),
                const Text("Town / City", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                const SizedBox(height: 30),
                const Text("Postcode", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: postCodeController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                const SizedBox(height: 40),
                const Text("Street", style: TextStyle(color: Colors.grey)),
                TextFormField(
                  controller: streetController,
                  decoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
                SizedBox(height: 10),
                Text('This will be your defautl shipping address.', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w300, fontSize: 15),),
                Text('This will be your defautl billing address.', style: TextStyle(color: Colors.black45, fontWeight: FontWeight.w300, fontSize: 15),),
              ],
            ),
                  SizedBox(height: 250),
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
                      child: const Text('Next', style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),),
                    ),
                  ),

                ]
                )
              ]
              )
          )
      ),
    );
  }
}
