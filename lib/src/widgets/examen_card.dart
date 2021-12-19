import 'package:flutter/material.dart';
import 'package:appo_lab/src/models/exam_model.dart';

class TablaCard extends StatelessWidget {
  const TablaCard({Key? key, required this.model}) : super(key: key);
  final Examenes model;

  @override
  Widget build(BuildContext context) {
    final url = model.img!.toString();

    final prioridad = Container(
        height: 32.0,
        width: 32.0,
        color: model.price == 3.5
            ? Colors.red
            
            : model.price == 2.25
                ? Colors.yellow
                : Colors.green,
        child:  model.price == 3.5
          ? Icon(Icons.cloud, color: model.price == 2.25 ? Colors.black : Colors.white)

          : Icon(Icons.circle,color: model.price == 5 ? Colors.black : Colors.white)
    );

    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white70, width: 1),
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: ListTile(
        leading: CircleAvatar(backgroundImage: NetworkImage(url)),
        title: Text(
          model.name.toString(),
          style: const TextStyle(fontSize: 18, color: Colors.black),
        ),
        
        subtitle: Text(model.description ?? ""),
        trailing: model.price == null 
                        ? null
                        : prioridad,
      ),
    );
  }
}