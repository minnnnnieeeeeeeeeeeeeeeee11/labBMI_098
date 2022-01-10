// import 'dart:js';

import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';
import 'bmi_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/bg1.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              menuHeader(),
              Padding(padding: EdgeInsets.only(bottom: 10)),
              welcomeText(),
              Padding(padding: EdgeInsets.only(bottom: 400)),
              bottomBtn(),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox bottomBtn() {
    return SizedBox(
      width: 180,
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BMIPage(),
                ));
          },
          child: const Text(
            'เริ่มต้นใช้งาน',
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32.0),
              ),
            ),
            backgroundColor: MaterialStateProperty.all(Colors.grey[200]),
            foregroundColor: MaterialStateProperty.all(Colors.blue),
          ),
        ),
      ),
    );
  }

  Column welcomeText() {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        Padding(padding: EdgeInsets.only(top: 30)),
        Text(
          'ยินดีต้อนรับเข้าสู่',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 29,
            color: Colors.black,
          ),
        ),
        Text(
          'แอปพลิเคชันคำนวณ BMI',
          style: TextStyle(
            fontSize: 25,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Row menuHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.help),
          label: const Text('ความช่วยเหลือ'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        Container(
          width: 2,
          height: 20,
          color: Colors.white,
        ),
        TextButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.info),
          label: const Text('เกี่ยวกับแอป'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
      ],
    );
  }
}
