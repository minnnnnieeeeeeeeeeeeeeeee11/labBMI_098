import 'package:bmi_app/pages/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class BMIPage extends StatefulWidget {
  const BMIPage({Key? key}) : super(key: key);

  @override
  _BMIPageState createState() => _BMIPageState();
}

class _BMIPageState extends State<BMIPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weight = TextEditingController();
  final TextEditingController _height = TextEditingController();

  late double _bmi;
  late String _txt;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI Calculator'),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/head.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              const Text(
                'กรอกข้อมูลของคุณ',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const Padding(padding: EdgeInsets.only(top: 25)),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    weight(),
                    hight(),
                  ],
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 15)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    var route = MaterialPageRoute(
                      builder: (context) => BMIresult(
                        weight: _weight.text,
                        height: _height.text,
                      ),
                    );
                    Navigator.push(context, route);
                  } else {
                    Alert(
                      context: context,
                      type: AlertType.error,
                      style: const AlertStyle(
                        titleStyle: TextStyle(color: Colors.red),
                        descStyle: TextStyle(color: Colors.red),
                      ),
                      desc: "กรุณากรอกข้อมูลให้ครบถ้วน",
                      buttons: [
                        DialogButton(
                          child: const Text(
                            "ลองอีกครั้ง",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.pop(context),
                          width: 120,
                          color: Colors.red,
                        )
                      ],
                    ).show();
                  }
                },
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 20),
                ),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(120, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox hight() {
    return SizedBox(
      width: 330,
      child: TextFormField(
        controller: _height,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกข้อมูลให้ครบ';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: Text('ส่วนสูง(เซนติเมตร)', style: TextStyle(fontSize: 20)),
          prefixIcon: Icon(Icons.height_outlined),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.black87,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.blue,
              )),
        ),
      ),
    );
  }

  SizedBox weight() {
    return SizedBox(
      width: 330,
      child: TextFormField(
        controller: _weight,
        validator: (value) {
          if (value!.isEmpty) {
            return 'กรุณากรอกน้ำหนัก';
          }
        },
        keyboardType: TextInputType.number,
        maxLength: 3,
        decoration: const InputDecoration(
          fillColor: Colors.white,
          filled: true,
          label: Text('น้ำหนัก(กิโลกรัม)', style: TextStyle(fontSize: 20)),
          prefixIcon: Icon(Icons.monitor_weight_outlined),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.grey,
              )),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.black87,
              )),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
              )),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                width: 2,
                color: Colors.red,
              )),
        ),
      ),
    );
  }
}
