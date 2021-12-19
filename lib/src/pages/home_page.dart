import 'package:appo_lab/src/models/exam_model.dart';
import 'package:appo_lab/src/services/exam_services.dart';
import 'package:appo_lab/src/widgets/examen_card.dart';
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
    return _catalogo == null ? 
    const Center(
      child: SizedBox(
        height: 50, width: 50.0, child: CircularProgressIndicator()),
      )
    : _catalogo!.isEmpty ?
      const Center(
        child: SizedBox(child : Text('No hay datos de los Examenes')),
      )
    : Container(
      decoration: const BoxDecoration(color: Colors.indigo),
      padding:
          const EdgeInsets.symmetric(vertical: 15.0, horizontal: 7.0),
      child: ListView(
          children: 
            _catalogo!.map((e) => TablaCard(model: e,)).toList()));
  }

  _downloadContent(){
    _apiService.getExamen().then((value) {
      _catalogo = value;
      setState(() {});
      });
  }
}
