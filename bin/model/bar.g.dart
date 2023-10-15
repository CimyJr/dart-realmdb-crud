// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bar.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Bar extends _Bar with RealmEntity, RealmObjectBase, RealmObject {
  Bar(
    ObjectId id,
    String name,
    String street,
    String housenumber,
  ) {
    RealmObjectBase.set(this, 'id', id);
    RealmObjectBase.set(this, 'name', name);
    RealmObjectBase.set(this, 'street', street);
    RealmObjectBase.set(this, 'housenumber', housenumber);
  }

  Bar._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, 'id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, 'id', value);

  @override
  String get name => RealmObjectBase.get<String>(this, 'name') as String;
  @override
  set name(String value) => RealmObjectBase.set(this, 'name', value);

  @override
  String get street => RealmObjectBase.get<String>(this, 'street') as String;
  @override
  set street(String value) => RealmObjectBase.set(this, 'street', value);

  @override
  String get housenumber =>
      RealmObjectBase.get<String>(this, 'housenumber') as String;
  @override
  set housenumber(String value) =>
      RealmObjectBase.set(this, 'housenumber', value);

  @override
  Stream<RealmObjectChanges<Bar>> get changes =>
      RealmObjectBase.getChanges<Bar>(this);

  @override
  Bar freeze() => RealmObjectBase.freezeObject<Bar>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Bar._);
    return const SchemaObject(ObjectType.realmObject, Bar, 'Bar', [
      SchemaProperty('id', RealmPropertyType.objectid, primaryKey: true),
      SchemaProperty('name', RealmPropertyType.string),
      SchemaProperty('street', RealmPropertyType.string),
      SchemaProperty('housenumber', RealmPropertyType.string),
    ]);
  }
}
