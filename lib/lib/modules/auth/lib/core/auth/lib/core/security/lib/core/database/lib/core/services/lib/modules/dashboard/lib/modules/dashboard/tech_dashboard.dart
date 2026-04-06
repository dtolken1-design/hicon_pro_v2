import 'package:flutter/material.dart';
import '../../core/services/job_service.dart';

class TechDashboard extends StatefulWidget {
  const TechDashboard({super.key});

  @override
  State<TechDashboard> createState() => _TechDashboardState();
}

class _TechDashboardState extends State<TechDashboard> {
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
        title: const Text("Technician Dashboard"),
        backgroundColor: Colors.red,
      ),
      body: jobs.isEmpty
          ? const Center(child: Text("No assigned jobs"))
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
                      job['assignedTo'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
