class Carrito{
  String id;
  String nombre;
  double precio;
  String unidad;
  String urlfoto;
  int cantidad;

  Carrito(this.id, this.nombre, this.precio, this.unidad, this.urlfoto,
      this.cantidad);

  Carrito.map(dynamic o){
    this.id = o["id"];
    this.nombre = o["nombre"];
    this.precio = o["precio"];
    this.unidad = o["unidad"];
    this.urlfoto = o["urlfoto"];
    this.cantidad = o["cantidad"];
  }

  Map<String, dynamic> toMap(){
    var map = new Map<String,dynamic>();
    map["id"] = id;
    map["nombre"] = nombre;
    map["precio"] = precio;
    map["unidad"] = unidad;
    map["urlfoto"] = urlfoto;
    map["cantidad"] = cantidad;
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data["id"] = id;
    data["nombre"] = nombre;
    data["precio"] = precio;
    data["unidad"] = unidad;
    data["urlfoto"] = urlfoto;
    data["cantidad"] = cantidad;

  }
}