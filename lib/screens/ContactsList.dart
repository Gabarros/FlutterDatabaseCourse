import 'package:flutter/material.dart';
import 'package:newbytebank/database/app_database.dart';
import 'package:newbytebank/models/Contact.dart';
import 'package:newbytebank/screens/ContactForm.dart';

class ContactsList extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: FutureBuilder(
        future: findAll(),
        builder: (context, snapshot) {
          
          final List<Contact> contacts = snapshot.data;

          return ListView.builder(
            itemCount: contacts.length,
            itemBuilder: (context, index) {
              return _ContactItem(contacts[index]);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                builder: (context) => ContactForm(),
              ))
              .then(
                (newContact) => debugPrint(newContact.toString()),
              );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final Contact contact;

  _ContactItem(this.contact);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contact.name,
          style: TextStyle(fontSize: 16),
        ),
        subtitle: Text(
          contact.accountNumber.toString(),
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
