import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class EmployeeTable extends WebComponent {
  Employees employees;
  Employee employee;
  @observable
  bool showEmployeeAdd = false;
  @observable
  bool showEmployeeEdit = false;
  @observable
  bool showEmployeeTasks = false;

  add() {
    ButtonElement addEmployee = query("#addEmployeeButton");
    if (addEmployee.text == 'Show Add') {
      showEmployeeAdd = true;
      addEmployee.text = 'Hide Add';
    } else {
      showEmployeeAdd = false;
      addEmployee.text = 'Show Add';
    }
  }

  edit(Employee employee) {
    showEmployeeEdit = true;
    this.employee = employee;
  }

  delete(Employee employee) {
    employees.remove(employee);
    showEmployeeTasks = false;
  }

  showTasks(Employee employee) {
    ButtonElement employeeTasks = query("#${employee.emailCode}");
    if (!showEmployeeTasks && employeeTasks.text == 'Show') {
      showEmployeeTasks = true;
      this.employee = employee;
      employee.tasks.internalList = toObservable(employee.tasks.internalList);
      employee.tasks.order();
      employeeTasks.text = 'Hide';
    } else if (showEmployeeTasks && employeeTasks.text == 'Hide') {
      showEmployeeTasks = false;
      employeeTasks.text = 'Show';
    }
  }
}