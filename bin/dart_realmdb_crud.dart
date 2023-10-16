import 'dart:developer';
import 'dart:io';
import 'package:xml/xml.dart';
import 'package:realm_dart/realm.dart';

import 'model/bar.dart';

 final config = Configuration.local([Bar.schema]); //path do banco
final realm = Realm(config);

String barname='';
String street='';
String housenumber='';
String type='';
String name='';
bool hasBarName = false;
bool hasStreet = false;
bool hasHouseNumber = false;

  void deleteData(){
   ///Deletar todos os bares

    final bar = realm.all<Bar>();
    for (int index = 0; index < bar.length; index++) {
      final mybar = bar[index];
      realm.write(() => realm.delete(mybar));
    }}
void main(List<String> arguments) {
 

  final file = File('dataBars.xml'); //definindo o documento
  final document = XmlDocument.parse(
      file.readAsStringSync()); //passando o conteúdo dele para string
  Iterable<XmlElement> data =
      document.findAllElements('node'); //query do elemento tag

  var typelist = document.findAllElements('tag').map((each) => each.getAttributeNode('tag'));
  log('$typelist');
  // var name = document.findAllElements('tag').map((each) => each.getAttribute('name'));
  
  int i = 0;
  
  // document.findAllElements('tag').forEach((tag) { 
  //   if(type.elementAt(i)=='k=name'){
  //     barname = name.elementAt(i);
  //     log('name: $barname ');
  //     log('\n');
  //   }
  //   if (type.elementAt(i) == 'k="addr:street"') {
  //     street = name.elementAt(i);
  //     log('Street: $street');
  //   }
  //   if (type.elementAt(i) == 'k="addr:housenumber"') {
  //     housenumber = name.elementAt(i);

  //     log('house number: $housenumber');
  //   }
  // i++;
  // });
  for (int index = 0; index < data.length; index++) {
    //foor para pega os atributos dento da query
    hasBarName = false;
    hasStreet = false;
    hasHouseNumber = false;
    type = data.elementAt(index).attributes[0].toString();
    name = data.elementAt(index).attributes[1].toString();
    String name2 = name.substring(3, name.length - 1); //manipulação da string
    log('$type');
    if (type == 'k="name"') {
      hasBarName = true;
      barname = name2;
      log('name: $barname ');
      log('\n');
    }
    if (type == 'k="addr:street"') {
      hasStreet = true;
      street = name2;
      log('Street: $street');
    }
    if (type == 'k="addr:housenumber"') {
      hasHouseNumber = true;
      housenumber = name2;

      log('house number: $housenumber');
    }



//  deleteData();
//     ///Adicionar no banco de dados

    //  final allbar = realm.all<Bar>();
    //   if(type == 'k="name"'){
    //    final bar = Bar(ObjectId(),hasBarName==false ? ' ' : barname, hasStreet==false ? ' ' : street, hasHouseNumber==false ? ' ' : housenumber);
    //   realm.write(() {
    //     realm.add(bar);
    //   });}
    }
    
//     if (index==0) {
//       final bar = Bar(ObjectId(), barname, street, housenumber);
//       realm.write(() {
//         realm.add(bar);
//       });
//     } else if (allbar[index-1].name == barname ) {
//   }  
//       else {
//         final bar = Bar(ObjectId(), barname, street, housenumber);
//         realm.write(() {
//         realm.add(bar);
//       });
//     }

 
  
  // }
  // realm.close();
}
