import 'package:flutter/material.dart';
import 'package:workshop1/pages/secondpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BMICalculator(),
    );
  }
}

class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  double bmiResult = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
        backgroundColor: Color.fromARGB(255, 129, 186, 250),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: NetworkImage(
                  'https://cdn4.iconfinder.com/data/icons/sambal/1000/leisure_gestures___meditation_meditate_zen_yoga_health_woman_sticker_people-64.png'),
              width: 300.0,
              height: 300.0,
            ),
            Text(
              'Calculate BMI',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Height (cm)',
                prefixIcon: Icon(Icons.height),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Weight (kg)',
                prefixIcon: Icon(Icons.accessibility),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                calculateBMI();
                navigateToResultPage(); // เรียกใช้ฟังก์ชันนี้เมื่อคำนวณ BMI เสร็จสิ้น
              },
              child: Text('Calculate BMI'),
            ),
          ],
        ),
      ),
    );
  }

  void calculateBMI() {
    double? height = double.tryParse(heightController.text);
    double? weight = double.tryParse(weightController.text);

    if (height == null || weight == null) {
      // Handle invalid input
      return;
    }

    double heightInMeters = height / 100;
    double bmi = weight / (heightInMeters * heightInMeters);

    setState(() {
      bmiResult = bmi;
    });
  }

  void navigateToResultPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ResultPage(bmiResult)),
    );
  }
}
