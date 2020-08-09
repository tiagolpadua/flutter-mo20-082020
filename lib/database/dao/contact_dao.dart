import 'package:bytebank/models/contact.dart';
import 'package:sqflite/sqlite_api.dart';
import '../app_database.dart';

class ContactDao {
  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query('contacts');
    final List<Contact> contacts = List();
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row['id'],
        row['name'],
        row['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
