import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
class pieChart extends StatefulWidget {
  const pieChart({super.key});

  @override
  State<pieChart> createState() => _pieChartState();
}

class _pieChartState extends State<pieChart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      child: PieChart(
        PieChartData(
            sections: [
              PieChartSectionData(
                value: 60,
                color: Colors.blueAccent,
              ),
              PieChartSectionData(
                value: 70,
                color: Colors.orangeAccent,
              ),
              PieChartSectionData(
                value: 90,
                color: Colors.redAccent,
              ),
              PieChartSectionData(
                value: 50,
                color: Colors.greenAccent,
              ),
              PieChartSectionData(
                value: 65,
                color: Colors.brown,
              ),
            ]
        ),
      ),
    );
  }

  }

