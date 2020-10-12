class Producto{
  int id;
  String nombre;
  String description;
  double precio;
  String urlfoto;
  String unidad;
  String subcategorias_id;

  Producto(this.id, this.nombre, this.description, this.precio, this.urlfoto, this.unidad, this.subcategorias_id);
  Producto.map(dynamic o){
    this.id = o["id"];
    this.nombre = o["nombre"];
    this.description = o["descrption"];
    this.precio = o["precio"];
    this.urlfoto = o["urlfoto"];
    this.unidad = o["unidad"];
    this.subcategorias_id = o["subcategorias_id"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String, dynamic>();
    map['id']=id;
    map['nombre']=nombre;
    map['description']=description;
    map['precio']=precio;
    map['urlfoto']=urlfoto;
    map['unidad']=unidad;
    map['subcategorias_id']=subcategorias_id;
  }

}