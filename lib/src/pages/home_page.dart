import 'package:appo_lab/src/models/exam_model.dart';
import 'package:appo_lab/src/services/exam_services.dart';
import 'package:appo_lab/src/widgets/examen_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:appo_lab/src/providers/main_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ExamenesService _apiService = ExamenesService();
  List<Examenes>? _catalogo;

  @override
  void initState() {
    super.initState();
    _downloadContent();
  }

  @override
  Widget build(BuildContext context) {
    final mainProvider = Provider.of<MainProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox.square(
          dimension: 60.0,
              child: Switch(
                  value: mainProvider.mode,
                  onChanged: (bool value) async 
                  {
                    mainProvider.mode = value;
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setBool("mode", value);
                  }
              )
        ),
        title: const Text('Trifasic - ')
      ),
      body: _catalogo == null ? 
    const Center(
      child: SizedBox(
        height: 50, width: 50.0, child: CircularProgressIndicator()),
      )
    : _catalogo!.isEmpty ?
      const Center(
        child: SizedBox(child : Text('No hay datos de los Examenes')),
      )
    : Container(
      padding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
          children: 
            _catalogo!.map((e) => TablaCard(model: e,)).toList())),
    );
  }

  _downloadContent(){
    _apiService.getExamen().then((value) {
      _catalogo = value;
      setState(() {});
      });
  }
}
