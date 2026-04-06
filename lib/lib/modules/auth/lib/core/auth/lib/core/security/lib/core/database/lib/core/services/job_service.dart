import '../database/db.dart';

class JobService {
  static Future<void> createJob({
    required String customer,
    required double price,
    required double cost,
    required String assignedTo,
  }) async {
    final db = await DB.database;

    double profit = price - cost;

    await db.insert('jobs', {
      'customer': customer,
      'status': 'pending',
      'price': price,
      'cost': cost,
      'profit': profit,
      'assignedTo': assignedTo,
    });
  }

  static Future<List<Map<String, dynamic>>> getJobs() async {
    final db = await DB.database;
    return await db.query('jobs');
  }

  static Future<void> updateStatus(int id, String status) async {
    final db = await DB.database;

    await db.update(
      'jobs',
      {'status': status},
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
