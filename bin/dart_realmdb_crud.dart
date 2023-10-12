import 'dart:developer';
import 'dart:io';
import 'package:xml/xml.dart';

void main(List<String> arguments) {
  final file = File('dataBars.xml');
  final document = XmlDocument.parse(file.readAsStringSync());
  Iterable<XmlElement> data = document.findAllElements('tag');
  for (int index = 0; index < data.length; index++) {
    String type = data.elementAt(index).attributes[0].toString();
    String name = data.elementAt(index).attributes[1].toString();
    String name2 = name.substring(3, name.length-1);
    if(type == 'k="name"') {
      // log('type: $type');
      log('name: $name2');
    }
    if(type == 'k="addr:street"'){
      log('Street: $name2');
    }
    if(type == 'k="addr:housenumber"'){
      log('house number: $name2');
    }
  }
}
