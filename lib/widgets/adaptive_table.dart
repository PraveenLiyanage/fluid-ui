import 'package:flutter/material.dart';
import '../core/breakpoints/fluid_breakpoints.dart';

class AdaptiveTableAction {
  final String label;
  final IconData icon;
  final Function(List<String> row) onTap;

  AdaptiveTableAction({
    required this.label,
    required this.icon,
    required this.onTap,
  });
}

class AdaptiveTable extends StatelessWidget {
  final List<String> columns;
  final List<List<String>> rows;
  final List<AdaptiveTableAction>? actions;
  final Function(int columnIndex, bool ascending)? onSort;

  const AdaptiveTable({
    super.key,
    required this.columns,
    required this.rows,
    this.actions,
    this.onSort,
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
        sortColumnIndex: 0,
        sortAscending: true,
        columns: [
          ...columns.map((c) => DataColumn(
                label: Text(c, style: const TextStyle(fontWeight: FontWeight.bold)),
                onSort: onSort,
              )),
          if (actions != null) const DataColumn(label: Text('Actions', style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        rows: rows.map((r) {
          return DataRow(
            cells: [
              ...r.map((cell) => DataCell(Text(cell))),
              if (actions != null)
                DataCell(Row(
                  mainAxisSize: MainAxisSize.min,
                  children: actions!
                      .map((a) => IconButton(
                            icon: Icon(a.icon, size: 18),
                            onPressed: () => a.onTap(r),
                            tooltip: a.label,
                          ))
                      .toList(),
                )),
            ],
          );
        }).toList(),
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
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...List.generate(columns.length, (i) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            columns[i],
                            style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        Expanded(
                          child: Text(row[i], style: const TextStyle(fontSize: 13)),
                        ),
                      ],
                    ),
                  );
                }),
                if (actions != null)
                  const Divider(),
                if (actions != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: actions!
                        .map((a) => TextButton.icon(
                              icon: Icon(a.icon, size: 16),
                              label: Text(a.label, style: const TextStyle(fontSize: 12)),
                              onPressed: () => a.onTap(row),
                            ))
                        .toList(),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
