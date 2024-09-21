import 'package:flutter/material.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:localization/localization/locales.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalization _flutterLocalization;

  late String _currentLocale;
  @override
  void initState() {
    super.initState();
    _flutterLocalization = FlutterLocalization.instance;
    _currentLocale = _flutterLocalization.currentLocale!.languageCode;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          LocaleData.title.getString(context),
        ),
        actions: [
          DropdownButton(
              value: _currentLocale,
              items: const [
                DropdownMenuItem(
                  child: Text("English"),
                  value: "en",
                ),
                DropdownMenuItem(
                  child: Text("Arabic"),
                  value: "ar",
                ),
                DropdownMenuItem(
                  child: Text("German"),
                  value: "de",
                ),
                DropdownMenuItem(
                  child: Text("Chinese"),
                  value: "zh",
                ),
                DropdownMenuItem(
                  child: Text("Pashto"),
                  value: "ph",
                ),
              ],
              onChanged: (value) {
                _setLocale(value);
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 30,
        ),
        child: Text(
          context.formatString(LocaleData.body, ["ALishba"]),
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }

  void _setLocale(String? value) {
    if (value == null) return;
    if (value == "en") {
      _flutterLocalization.translate("en");
    } else if (value == "ar") {
      _flutterLocalization.translate("ar");
    } else if (value == "de") {
      _flutterLocalization.translate("de");
    } else if (value == "zh") {
      _flutterLocalization.translate("zh");
    } else if (value == "ph") {
      _flutterLocalization.translate("ph");
    } else {
      return;
    }
    setState(() {
      _currentLocale = value;
    });
  }
}
