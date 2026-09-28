import 'dart:math';

import 'package:bmi_app/utils/route.dart';
import 'package:bmi_app/widgets/gender_selected.dart';
import 'package:bmi_app/widgets/info_user_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isSwitched = false;
  bool isMale = true;
  double sliderValue = 150;
  int weightValue = 60;
  int ageValue = 26;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff1C2135),
        appBar: AppBar(
          backgroundColor: Color(0xff24263B),
          leading: Switch(
            value: true,
            onChanged: (value) {
              value = isSwitched;
              setState(() {});
            },
            activeColor: Color(0xff3D81E8),
          ),
          title: Center(
            child: Text(
              "BMI Calculator",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            spacing: 25,
            children: [
              Expanded(
                child: Row(
                  spacing: 10,
                  children: [
                    GenderSelected(
                      onTap: () {
                        isMale = true;
                        setState(() {});
                      },
                      image: "assets/images/male_image.png",
                      title: "Male",
                      isSelected: isMale,
                    ),
                    GenderSelected(
                      onTap: () {
                        isMale = false;
                        setState(() {});
                      },
                      image: "assets/images/female_image.png",
                      title: "Female",
                      isSelected: !isMale,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xff333244),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Height",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                          color: Color(0xff8B8C9E),
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        sliderValue.round().toString(),
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      Slider(
                        activeColor: Color(0xff3D81E8),
                        value: sliderValue,
                        onChanged: (val) {
                          sliderValue = val;
                          setState(() {});
                        },
                        min: 30,
                        max: 200,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  spacing: 10,
                  children: [
                    InfoDetailsUser(
                      title: "Weight",
                      value: weightValue,
                      addClick: () {
                        if (weightValue <= 200) {
                          weightValue++;
                          setState(() {});
                        }
                      },
                      removeClick: () {
                        if (weightValue > 1) {
                          weightValue--;
                          setState(() {});
                        }
                      },
                    ),
                    InfoDetailsUser(
                      title: "Age",
                      value: ageValue,
                      addClick: () {
                        if (ageValue < 100) {
                          ageValue++;
                          setState(() {});
                        }
                        ageValue++;
                        setState(() {});
                      },
                      removeClick: () {
                        if (ageValue > 10) {
                          ageValue--;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: MaterialButton(
          height: 100,
          color: Color(0xff3D81E8),
          onPressed: () {
            var userData = BMIModel(
              gender: isMale ? "Male" : "Female",
              height: sliderValue,
              weight: weightValue,
              age: ageValue,
            );
            Navigator.of(
              context,
            ).pushNamed(AppRoute.resultScreen, arguments: userData);
          },
          child: Text(
            "Calculate",
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class BMIModel {
  String gender;
  double height;
  int weight;
  int age;
  BMIModel({
    required this.gender,
    required this.height,
    required this.weight,
    required this.age,
  });

  double get calcBmi {
    double bmi = weight / pow(height / 100, 2).roundToDouble();
    return bmi;
  }

  Color get categoryColor {
    switch (resultBmi) {
      case 'Underweight':
        return Color(0xff3F51B5);
      case 'Normal':
        return Color(0xff4CAF50);
      case 'Overweight':
        return Color.fromARGB(255, 57, 58, 70);
      case 'Obese':
        return Color.fromARGB(255, 181, 63, 63);
      default:
        return Color(0xff9E9E9E);
    }
  }

  String get resultBmi {
    if (calcBmi < 18.5) {
      return "Underweight";
    } else if (calcBmi < 25) {
      return "Normal";
    } else if (calcBmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
}
