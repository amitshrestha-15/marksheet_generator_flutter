class MarksheetGeneratorViewModel {
  String firstName = '';
  String lastName = '';
  List<String> modules = ['Flutter', 'API', 'Design Thinking', 'Individual'];
  String selectedModule = '';
  String marks = '';
  Map<String, int> moduleMarks = {};

  get fullName => null;

  get totalMarks => null;

  get result => null;

  get division => null;

  void setFirstName(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    lastName = value;
  }

  void setSelectedModule(String value) {
    selectedModule = value;
  }

  void setMarks(String value) {
    marks = value;
  }

  void generateMarksheet() {
    if (selectedModule.isNotEmpty && marks.isNotEmpty) {
      final int marksValue = int.tryParse(marks) ?? 0;
      moduleMarks[selectedModule] = marksValue;
    }
  }

  String getMarksForModule(String module) {
    if (moduleMarks.containsKey(module)) {
      return moduleMarks[module].toString();
    }
    return '';
  }

  int calculateTotalMarks() {
    int totalMarks = 0;
    moduleMarks.forEach((key, value) {
      totalMarks += value;
    });
    return totalMarks;
  }

  double calculatePercentage() {
    final int totalMarks = calculateTotalMarks();
    if (totalMarks > 0) {
      return (totalMarks / (moduleMarks.length * 100)) * 100;
    }
    return 0;
  }

  String getDivision() {
    final double percentage = calculatePercentage();
    if (percentage >= 60) {
      return '1st';
    } else if (percentage >= 50) {
      return '2nd';
    } else if (percentage >= 40) {
      return '3rd';
    } else {
      return 'Fail';
    }
  }
}
