class Subcategoria{
  int id;
  String nombre;
  String urlfoto;
  String categorias_id;

  Subcategoria(this.id, this.nombre, this.urlfoto, this.categorias_id);
  Subcategoria.map(dynamic o){
    this.id = o["id"];
    this.nombre = o["nombre"];
    this.urlfoto = o["urlfoto"];
    this.categorias_id = o["categorias_id"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id'] = id;
    map['nombre'] = nombre;
    map['urlfoto'] = urlfoto;
    map['categorias_id'] = categorias_id;
  }
}