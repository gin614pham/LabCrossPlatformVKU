import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'results_page.dart';
import 'components/reusable_card.dart';
import 'components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 170;
  int weight = 60;
  int age = 20;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('BMI CALCULATOR')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.male
                          ? Colors.blue
                          : (Colors.grey[800] ?? Colors.grey),
                      childCard: const IconContent(
                        icon: FontAwesomeIcons.mars,
                        label: 'NAM',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      color: selectedGender == Gender.female
                          ? Colors.pink
                          : (Colors.grey[800] ?? Colors.grey),
                      childCard: const IconContent(
                        icon: FontAwesomeIcons.venus,
                        label: 'NỮ',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              childCard: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('CHIỀU CAO', style: TextStyle(fontSize: 18)),
                  Text('$height cm',
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold)),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    onChanged: (value) {
                      setState(() {
                        height = value.toInt();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('CÂN NẶNG', style: TextStyle(fontSize: 18)),
                        Text('$weight kg',
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: const Icon(Icons.remove),
                              onPressed: () => setState(() => weight--),
                            ),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              child: const Icon(Icons.add),
                              onPressed: () => setState(() => weight++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    childCard: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('TUỔI', style: TextStyle(fontSize: 18)),
                        Text('$age',
                            style: const TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              child: const Icon(Icons.remove),
                              onPressed: () => setState(() => age--),
                            ),
                            const SizedBox(width: 20),
                            FloatingActionButton(
                              child: const Icon(Icons.add),
                              onPressed: () => setState(() => age++),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                        bmi: weight / ((height / 100) * (height / 100)))),
              );
            },
            child: Container(
                color: Colors.pink,
                height: 80,
                width: double.infinity,
                child: const Center(
                    child: Text('TÍNH BMI',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold)))),
          ),
        ],
      ),
    );
  }
}
