import 'package:newbytebank/dao/Contact_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(
    await getDatabasesPath(),
    'newbytebank.db',
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDAO.tableSql);
    },
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
