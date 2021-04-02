import 'dart:html';
//import 'dart:js' as js;
import 'dart:async';
import 'dart:indexed_db' as idb;

class MyClass {
  static const String objectStoreName = 'heroes';
  static const String titleIndex = 'title_index';
  static const String readonly = 'readonly';
  static const String readwrite = 'readwrite';

//  List<Map<String,String>> heroes = [
//    {"name": 'Rasmus', 'age': '200'},
//    {"name": 'Las', 'age': '100'},
////    {"name": '', 'age': ''},
//  ];

  idb.Database _db;

  MyClass() {
    window.indexedDB.open('heroesDB', version: 3,
    onUpgradeNeeded: _createDatabase).then((idb.Database db) {
      print('db created ${db != null}');
      _db = db;
//      loadDataFromDb();
    });
  }

  void _createDatabase(idb.VersionChangeEvent e) {
    idb.Database db = (e.target as idb.Request).result;
    var store = db.createObjectStore(objectStoreName, autoIncrement: true);
    store.createIndex(titleIndex, 'title');
  }

  Future<Map<int, Map<String,String>>> loadDataFromDb() async {
    var trans = _db.transaction(objectStoreName, readwrite);
    var store = trans.objectStore(objectStoreName);

    Map<String,Map<String,String>> dbItems = new Map();
    var cursors = store.openCursor(autoAdvance: true).asBroadcastStream();
    cursors.listen((cursor) {
        Map h = cursor.value;
        h['age'] = 1000+cursor.key;
        h['title'] = "${h['title']}_${cursor.key}";
        print(h);
//      store.put()
      dbItems[cursor.key] = h;
    });

//    cursors.length.then((_) {
//      dbItems;
//    });


    await cursors.length;
    print("items: \n ${dbItems}");
    return dbItems;
  }

  Future _save(Map item) {
    var trans = _db.transaction(objectStoreName, readwrite);
    var store = trans.objectStore(objectStoreName);

    return store.add(item).then((key) {
      print('Saved item: ${item} \nWith key: $key');

      return trans.completed;
    });
  }

  Future _delete(key) {
    var trans = _db.transaction(objectStoreName, 'readwrite');
    trans.objectStore(objectStoreName).delete(key);
    return trans.completed;
  }

}

MyClass heroes;
int nr = 0;

save(_) {
  heroes._save({'title': 'ttl${nr++}', 'age': nr+100});
}

loadData(_) async {
  Map m = await heroes.loadDataFromDb();
  UListElement ul = new UListElement();
  m.forEach((k, v) {
    ul.append(new LIElement()..text = 'key: $k title: ${v['title']} age: ${v['age']}');
  });

  querySelector('#output').append(ul);
}

main() {

  heroes = new MyClass();

  querySelector('#b1').onClick.listen(save);
  querySelector('#b2').onClick.listen(loadData);
//  heroes._save({'name': 'B', 'age': '1'});


}
