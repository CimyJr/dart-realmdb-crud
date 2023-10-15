import 'dart:developer';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:realm_dart/realm.dart';

import 'model/bar.dart';

String barname = '';
String street = '';
String housenumber = '';
void main(List<String> arguments) {
  final config = Configuration.local([Bar.schema]); //path do banco
  final realm = Realm(config);

  final file = File('dataBars.xml'); //definindo o documento
  final document = XmlDocument.parse(
      file.readAsStringSync()); //passando o conteúdo dele para string
  Iterable<XmlElement> data =
      document.findAllElements('tag'); //query do elemento tag

  for (int index = 0; index < data.length; index++) {
    //foor para pega os atributos dento da query
    String type = data.elementAt(index).attributes[0].toString();
    String name = data.elementAt(index).attributes[1].toString();
    String name2 = name.substring(3, name.length - 1); //manipulação da string

    if (type == 'k="name"') {
      barname = name2;
      log('name: $barname \n');
    }
    if (type == 'k="addr:street"') {
      street = name2;
      log('Street: $street');
    }
    if (type == 'k="addr:housenumber"') {
      housenumber = name2;

      log('house number: $housenumber');
    }

    ///Adicionar no banco de dados

    final allbar = realm.all<Bar>();

    if (index==0) {
      final bar = Bar(ObjectId(), barname, street, housenumber);
      realm.write(() {
        realm.add(bar);
      });
    } else if(index > 0 && index <= allbar.length) {
      if (allbar[index-1].name == barname) {
    } else {
      final bar = Bar(ObjectId(), barname, street, housenumber);
      realm.write(() {
        realm.add(bar);
      });
    }

    ///Deletar todos os bares

    // final bar = realm.all<Bar>();
    // for (int index = 0; index < bar.length; index++) {
    //   final mybar = bar[index];
    //   realm.write(() => realm.delete(mybar));
    // }
  
  }
  // realm.close();
}
}