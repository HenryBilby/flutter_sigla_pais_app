import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

mixin Mensagem {
  void showMensagem(String msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orangeAccent,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }
}