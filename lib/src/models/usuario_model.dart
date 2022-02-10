import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {
    Usuario({
        this.id,
        this.img,
        this.username,
        this.numero,
        this.correo,
        this.direccion,
    });

    String? id;
    String? img;
    String? username;
    String? numero;
    String? correo;
    String? direccion;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        img: json["img"],
        username: json["username"],
        numero: json["numero"],
        correo: json["correo"],
        direccion: json["direccion"],
    );

    Map<String, dynamic> toJson() => {
        //"id": id,
        "img": img,
        "username": username,
        "numero": numero,
        "correo": correo,
        "direccion": direccion,
    };
}
