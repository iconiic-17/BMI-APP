import 'package:flutter/material.dart';

class GenderSelected extends StatelessWidget {
  const GenderSelected({
    super.key,
    required this.image,
    required this.title,
    required this.isSelected,
    required this.onTap,
  });

  final String image;
  final String title;
  final bool isSelected;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Color(0xff24263B) : Color(0xff333244),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.white : Color(0xff333244),
            ),
          ),
          child: Column(
            children: [
              Image.asset(image, width: 144, height: 144),
              Text(
                title,
                style: TextStyle(
                  color: Color(0xff8B8C9E),
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
