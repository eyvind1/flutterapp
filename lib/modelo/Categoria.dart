class Categoria{
  int id;
  String nombre;
  String urlfoto;

  Categoria(this.id, this.nombre, this.urlfoto);
  Categoria.map(dynamic o){
    this.id = o["id"];
    this.nombre = o["nombre"];
    this.urlfoto = o["urlfoto"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    map['urlfoto'] = urlfoto;
  }
}