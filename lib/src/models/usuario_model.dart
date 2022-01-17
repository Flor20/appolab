import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.id,
        this.img,
        this.nombre,
        this.numero,
        this.correo,
        this.direccion,
    });

    String? id;
    String? img;
    String? nombre;
    String? numero;
    String? correo;
    String? direccion;

    factory Usuario.created(String value) =>
      Usuario(id: value, nombre: value);

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        img: json["img"],
        nombre: json["nombre"],
        numero: json["numero"],
        correo: json["correo"],
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "img": img,
        "nombre": nombre,
        "numero": numero,
        "correo": correo,
        "direccion": direccion,
    };
}
