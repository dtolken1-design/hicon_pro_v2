import 'package:flutter/material.dart';
import '../../core/services/job_service.dart';

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  List jobs = [];

  @override
  void initState() {
    super.initState();
    loadJobs();
  }

  void loadJobs() async {
    final data = await JobService.getJobs();
    setState(() {
      jobs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.red,
      ),
      body: jobs.isEmpty
          ? const Center(child: Text("No jobs yet"))
          : ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];

                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(job['customer'] ?? ''),
                    subtitle: Text("Status: ${job['status']}"),
                    trailing: Text(
                      "R${job['profit']}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
