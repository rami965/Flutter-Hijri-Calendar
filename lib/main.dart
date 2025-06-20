import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hijri_calendar/Hijri_Calendar/hijri_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: [GlobalMaterialLocalizations.delegate, GlobalWidgetsLocalizations.delegate, GlobalCupertinoLocalizations.delegate],
      supportedLocales: [
        //     const Locale('en', 'USA'),
        const Locale('ar', 'SA'),
      ],
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedDate = HijriCalendar.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.inversePrimary, title: Text(widget.title)),
      body: Center(
        child: HijriMonthPicker(
          lastDate: HijriCalendar()
            ..hYear = 1448
            ..hMonth = 9
            ..hDay = 25,
          firstDate: HijriCalendar()
            ..hYear = 1438
            ..hMonth = 12
            ..hDay = 25,
          onChanged: (HijriCalendar value) {
            setState(() {
              selectedDate = value;
            });
          },
          selectedDate: selectedDate,
        ),
      ),
    );
  }
}
