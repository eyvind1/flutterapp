import 'package:deliveryapp/modelo/Categoria.dart';
import 'package:deliveryapp/modelo/Subcategoria.dart';
import 'package:deliveryapp/modelo/Producto.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
// dbmanager

class DBHelper{
  static Database _db;

  Future<Database> get bd async{
    if(_db != null)
      {
        return _db;
      }
    else{
      _db = await iniciarDB();
    }
    return _db;
  }

  iniciarDB() async{
    io.Directory d = await getApplicationDocumentsDirectory();
    String path = join(d.path,"basedatos.db");
    var base = await openDatabase(path,version:1,onCreate: _onCreate);
    return base;
  }

  void _onCreate(Database db, int version) async{
    await db.execute("CREATE TABLE categoria(id INTEGER, nombre TEXT, urlfoto TEXT)");
    await db.execute("CREATE TABLE subcategoria(id INTEGER, nombre TEXT, urlfoto TEXT, categorias_id TEXT)");
    await db.execute("CREATE TABLE producto(id INTEGER, nombre TEXT,descripcion TEXT, precio REAL, urlfoto TEXT, unidad TEXT, subcategorias_id TEXT)");
    print("Tablas creadas correctamente");
  }
  // metodos categoria
  Future<int> saveCategoria(Categoria categoria) async{
    var dbCliente = await bd;
    int response = await dbCliente.insert("categoria", categoria.toMap());
    return response;
  }

  Future<List<Categoria>> getCategoria(String condicion) async{
    var dbCliente = await bd;
    List<Map> lista = await dbCliente.rawQuery("SELECT * FROM CATEGORIA WHERE"+condicion);
    List<Categoria> categoria = new List();

    for(int i=0;i<lista.length;i++){
      categoria.add(new Categoria(
          lista[i]["id"],
          lista[i]["nombre"],
          lista[i]["urlfoto"]
      )
      );
      return categoria;
    }


  }
  // metodos subcategoria
  Future<int> saveSubcategoria(Subcategoria subcategoria) async{
    var dbCliente = await bd;
    int response = await dbCliente.insert("subcategoria", subcategoria.toMap());
    return response;
  }

  Future<List<Subcategoria>> getSubcategoria(String condicion) async{
    var dbCliente = await bd;
    List<Map> lista = await dbCliente.rawQuery("SELECT * FROM SUBCATEGORIA WHERE"+condicion);
    List<Subcategoria> subcategoria = new List();

    for(int i=0;i<lista.length;i++){
      subcategoria.add(new Subcategoria(
          lista[i]["id"],
          lista[i]["nombre"],
          lista[i]["urlfoto"],
          lista[i]["categorias_id"]
      )
      );
      return subcategoria;
    }


  }

  // metodos productos
  Future<int> saveProducto(Producto p) async{
    var dbCliente = await bd;
    int response = await dbCliente.insert("producto", p.toMap());
    return response;
  }

  Future<List<Producto>> getProducto(String condicion) async{
    var dbCliente = await bd;
    List<Map> lista = await dbCliente.rawQuery("SELECT * FROM PRODUCTO WHERE"+condicion);
    List<Producto> producto = new List();

    for(int i=0;i<lista.length;i++){
      producto.add(new Producto(
          lista[i]["id"],
          lista[i]["nombre"],
          lista[i]["descripcion"],
          lista[i]["precio"],
          lista[i]["urlfoto"],
          lista[i]["unidad"],
          lista[i]["subcategorias_id"]
      )
      );
      return producto;
    }


  }

  //borrar regidstros vaciar
  Future<int> deleteTable(String tabla, String condicion) async{
    var dbCliente = await bd;
    return await dbCliente.rawDelete("delete from "+tabla+"where"+condicion);
  }

}