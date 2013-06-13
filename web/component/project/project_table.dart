import 'dart:html';

import 'package:dartlero_project_tasks/dartlero_project_tasks.dart';
import 'package:web_ui/web_ui.dart';

class ProjectTable extends WebComponent {
  Projects projects;
  Project project;
  @observable
  bool showProjectAdd = false;
  @observable
  bool showProjectEdit = false;
  @observable
  bool showProjectTasks = false;

  add() {
    ButtonElement addProject = query("#addProjectButton");
    if (addProject.text == 'Show Add') {
      showProjectAdd = true;
      addProject.text = 'Hide Add';
    } else {
      showProjectAdd = false;
      addProject.text = 'Show Add';
    }
  }

  edit(project) {
    showProjectEdit = true;
    this.project = project;
  }

  delete(project) {
    projects.remove(project);
    showProjectTasks = false;
  }

  showTasks(project) {
    showProjectTasks = !showProjectTasks;
    if (showProjectTasks) {
      this.project = project;
      project.tasks.internalList = toObservable(project.tasks.internalList);
      project.tasks.order();
    }
  }
}