import 'package:newbytebank/database/app_database.dart';
import 'package:newbytebank/models/Contact.dart';
import 'package:sqflite/sqflite.dart';

class ContactDAO {
  static const String tableSql = 'CREATE TABLE $_tableName('
      'id INTEGER PRIMARY KEY, '
      'name TEXT, '
      'account_number INTEGER)';

  static const String _tableName = 'contacts';
  Future<int> save(Contact contact) async {
    final Database database = await getDatabase();

    Map<String, dynamic> contactMap = _toMap(contact);

    return database.insert(_tableName, contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final Database database = await getDatabase();
    final List<Map<String, dynamic>> results = await database.query(_tableName);
    
    List<Contact> contacts = _toList(results);

    return contacts;
  }

  List<Contact> _toList(List<Map<String, dynamic>> results) {
    final List<Contact> contacts = List();
    
    for (Map<String, dynamic> row in results) {
      var contact2 = Contact(
        row['id'],
        row['name'],
        row['account_number'],
      );
      final Contact contact = contact2;
      contacts.add(contact);
    }
    return contacts;
  }
}
