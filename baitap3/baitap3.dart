abstract class Employee {
  String name;
  String id;

  Employee(this.name, this.id);

  void printInfo() {
    print('Name: $name, ID: $id');
  }

  double calculateSalary();
}

abstract class Workable {
  void doWork();
}

class OfficeWorker extends Employee implements Workable {
  final String department;

  OfficeWorker(String name, String id, this.department) : super(name, id);

  @override
  double calculateSalary() {
    return 20000;
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Department: $department');
  }

  @override
  void doWork() {
    print('$name đang làm việc tại phòng ban: $department');
  }
}

class TechWorker extends Employee implements Workable {
  final String field;

  TechWorker(String name, String id, this.field) : super(name, id);

  @override
  double calculateSalary() {
    return 5000 + 2000;
  }

  @override
  void printInfo() {
    super.printInfo();
    print('Field: $field');
  }

  @override
  void doWork() {
    print('$name làm việc tại lĩnh vực $field');
  }
}

class Company {
  List<Employee> employees = [];

  void addEmployee(Employee employee) {
    employees.add(employee);
  }

  void printAllEmployees() {
    for (var employee in employees) {
      employee.printInfo();
      print('Lương: ${employee.calculateSalary()}');
    }
  }

  double getTotalSalary() {
    double totalSalary = 0.0;
    for (var employee in employees) {
      totalSalary += employee.calculateSalary();
    }
    return totalSalary;
  }
}

void main() {
  var company = Company();
  var officeWorker = OfficeWorker('Khải', '2712', 'Thực tập');
  var techWorker = TechWorker('A.Hiếu', '8386', 'Software Development');

  company.addEmployee(officeWorker);
  company.addEmployee(techWorker);

  print('Tất cả nhân viên: ');
  company.printAllEmployees();

  print('Tổng lương: ${company.getTotalSalary()}');
}