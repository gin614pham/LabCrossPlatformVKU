import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  final double bmi;
  ResultsPage({required this.bmi});

  String getResult() {
    if (bmi >= 25)
      return 'Thừa cân';
    else if (bmi > 18.5)
      return 'Bình thường';
    else
      return 'Thiếu cân';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('KẾT QUẢ BMI')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Chỉ số BMI của bạn:', style: TextStyle(fontSize: 25)),
            Text(bmi.toStringAsFixed(1),
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
            Text(getResult(),
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('TÍNH LẠI', style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
