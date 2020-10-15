import 'package:flutter/material.dart';
import 'package:deliveryapp/carrito/Carrito.dart';

class CarritoCompra extends ChangeNotifier{
  Map<String, Carrito> _items = {};
  Map<String, Carrito> get items{
    return {..._items};
  }

  int get cantidadItems{
    return _items.length;
  }

  double get subtotal{
    var _subtotal=0.0;
    _items.forEach((key, Carrito)=> _subtotal+= Carrito.precio * Carrito.cantidad);
    return _subtotal;
  }

  double get impuesto{
    var _impuesto=0.0;
    _impuesto = this.subtotal*0.18;
    return _impuesto;
  }

  double get total{
    var _total=0.0;
    _total = this.subtotal*1.18;
    return _total;
  }

  void agregarItem(String _id, String _nombre, double _precio, String _unidad, String _urlfoto){
    if(_items.containsKey(_id)){
      //update
      _items.update(
          _id,
              (old) => Carrito(
                  id:old.id,
                  nombre: old.nombre,
                  precio: old.precio,
                  unidad: old.unidad,
                  urlfoto: old.urlfoto,
                  cantidad: old.cantidad+1
                )
      );
    }else{
      //agregar
      _items.putIfAbsent(
          _id,
              () => Carrito(
                id: _id,
                nombre: _nombre,
                precio: _precio,
                unidad: _unidad,
                urlfoto: _urlfoto,
                cantidad: 1
      )
      );
    }
  }


  void decrementarCantidad(String _id){
    if(_items.containsKey(_id)) return;

    if(_items[_id].cantidad > 1){
      _items.update(
          _id,
              (old) => Carrito(
                  id:old.id,
                  nombre: old.nombre,
                  precio: old.precio,
                  unidad: old.unidad,
                  urlfoto: old.urlfoto,
                  cantidad: old.cantidad - 1)
      );
    }
  }

  void removerItems(){
    _items = {};
  }

  void removerItem(String _id){
    _items.remove(_id);
  }

}