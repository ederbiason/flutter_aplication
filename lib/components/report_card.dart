import 'package:flutter/material.dart';

class ReportCard extends StatelessWidget {
  final String title;
  final String description;

  const ReportCard({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Stack(children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              color: Color(0xFF1A254E),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    shadows: [
                      Shadow(color: Color(0xFFFFFFFF), offset: Offset(0, -5))
                    ],
                    decoration: TextDecoration.underline,
                    decorationColor: Color(0xFFFFFFFF),
                    color: Colors.transparent,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Icon(
            Icons.chevron_right,
            color: Color(0xFF565A6B),
            size: 40,
          ),
        )
      ]),
    );
  }
}
