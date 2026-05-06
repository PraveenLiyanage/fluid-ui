import 'package:flutter/material.dart';
import '../core/breakpoints/fluid_breakpoints.dart';

class AdaptiveTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;
  final String title;

  const AdaptiveTable({
    super.key,
    required this.columns,
    required this.rows,
    this.title = 'Table Data',
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < FluidBreakpoints.mobile;

        if (isMobile) {
          return _buildMobileCards();
        }

        return _buildDesktopTable();
      },
    );
  }

  Widget _buildDesktopTable() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columns: columns
            .map((c) => DataColumn(label: Text(c, style: const TextStyle(fontWeight: FontWeight.bold))))
            .toList(),
        rows: rows
            .map((r) => DataRow(cells: r.map((cell) => DataCell(Text(cell))).toList()))
            .toList(),
      ),
    );
  }

  Widget _buildMobileCards() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: rows.length,
      itemBuilder: (context, index) {
        final row = rows[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8),
          elevation: 2,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(columns.length, (i) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 100,
                        child: Text(
                          columns[i],
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                        ),
                      ),
                      Expanded(
                        child: Text(row[i]),
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        );
      },
    );
  }
}
