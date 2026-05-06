import 'package:flutter/material.dart';
import 'package:fluid_ui/fluid_ui.dart';

void main() {
  runApp(
    const FluidApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fluid_ui Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold(
      sidebar: _buildSidebar(context),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(FluidSpacing.md),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const AdaptiveText(
              'Fluid Intelligence Dashboard',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: FluidSpacing.lg),
            AdaptiveGrid(
              children: [
                _buildStatCard('Revenue', '\$12,450', Colors.green),
                _buildStatCard('Users', '1,205', Colors.blue),
                _buildStatCard('Performance', '98%', Colors.orange),
                _buildStatCard('Security', 'Healthy', Colors.purple),
              ],
            ),
            const SizedBox(height: FluidSpacing.xl),
            const AdaptiveText(
              'Responsive Data Table',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: FluidSpacing.md),
            const AdaptiveTable(
              columns: ['ID', 'Name', 'Status', 'Date'],
              rows: [
                ['#101', 'John Doe', 'Active', '2026-05-01'],
                ['#102', 'Jane Smith', 'Pending', '2026-05-02'],
                ['#103', 'Bob Johnson', 'Completed', '2026-05-03'],
                ['#104', 'Alice Brown', 'Active', '2026-05-04'],
              ],
            ),
            const SizedBox(height: FluidSpacing.xl),
            const AdaptiveText(
              'Adaptive Layout Transformation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: FluidSpacing.md),
            AdaptiveRow(
              children: [
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Text('Left / Top Content')),
                ),
                Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Center(child: Text('Right / Bottom Content')),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(right: BorderSide(color: Colors.grey.withOpacity(0.2))),
      ),
      child: Column(
        children: [
          const DrawerHeader(
            child: Center(
              child: AdaptiveText(
                'fluid_ui',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text('Dashboard'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.analytics_outlined),
            title: const Text('Analytics'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text('Settings'),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: color.withOpacity(0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            Text(value, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
