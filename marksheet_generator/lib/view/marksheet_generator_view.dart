  import 'package:flutter/material.dart';
import 'package:marksheet_generator/viewmodel/marksheet_generator_viewmodel.dart';

  class MarksheetGeneratorView extends StatefulWidget {
    const MarksheetGeneratorView({required Key key}) : super(key: key);

    @override
    MarksheetGeneratorViewState createState() => MarksheetGeneratorViewState();
  }

  class MarksheetGeneratorViewState extends State<MarksheetGeneratorView> {
    late MarksheetGeneratorViewModel _viewModel;

    @override
    void initState() {
      super.initState();
      _viewModel = MarksheetGeneratorViewModel();
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text('Marksheet Generator')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Student'),
                const SizedBox(height: 8.0),
                TextField(
                  decoration: const InputDecoration(hintText: 'First Name'),
                  onChanged: (value) => _viewModel.setFirstName(value),
                ),
                const SizedBox(height: 8.0),
                TextField(
                  decoration: const InputDecoration(hintText: 'Last Name'),
                  onChanged: (value) => _viewModel.setLastName(value),
                ),
                const SizedBox(height: 16.0),
                const Text('Module'),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
  value: _viewModel.selectedModule.isNotEmpty ? _viewModel.selectedModule : null,
  items: _viewModel.modules.map((module) {
    return DropdownMenuItem(
      value: module,
      child: Text(module),
    );
  }).toList(),
  onChanged: (value) => _viewModel.setSelectedModule(value ?? ''),
),
                const SizedBox(height: 16.0),
                const Text('Marks (up to 100)'),
                const SizedBox(height: 8.0),
                TextField(
                  decoration: const InputDecoration(hintText: 'Enter Marks'),
                  keyboardType: TextInputType.number,
                  onChanged: (value) => _viewModel.setMarks(value),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    _viewModel.generateMarksheet();
                    setState(() {});
                  },
                  child: const Text('Generate Marksheet'),
                ),
                const SizedBox(height: 16.0),
                const Text('Marksheet Details', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('Module')),
                      DataColumn(label: Text('Marks')),
                    ],
                    rows: _viewModel.modules.map((module) {
                      return DataRow(cells: [
                        DataCell(Text(module)),
                        DataCell(Text(_viewModel.getMarksForModule(module))),
                      ]);
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 16.0),
                Text('Total Marks: ${_viewModel.calculateTotalMarks()}'),
                Text('Percentage: ${_viewModel.calculatePercentage()}%'),
                Text('Division: ${_viewModel.getDivision()}'),
              ],
            ),
          ),
        ),
      );
    }
  }
