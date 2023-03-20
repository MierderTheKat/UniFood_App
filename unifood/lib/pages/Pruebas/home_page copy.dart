// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print, sized_box_for_whitespace, file_names

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

Container buildChart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: sectionsChart),
      ),
    );
  }


List<PieChartSectionData> sectionsChart = [
    PieChartSectionData(
      value: 35,
      title: "35%",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 45,
      title: "45%",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 15,
      title: "15%",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 5,
      title: "5%",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
  ];