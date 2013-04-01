package com.todo_mobile;

import com.calatrava.CalatravaPage;
import com.calatrava.shell.WebViewActivity;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@CalatravaPage(name = "toDoList")
public class ToDoList extends WebViewActivity
{
  @Override
  protected String getPageName() {
    return "toDoList";
  }

  @Override
  protected List<String> getEvents() {
    return Arrays.asList("addNewToDo");
  }

  @Override
  protected List<String> getFields() {
    return Arrays.asList("newToDoText");
  }
}
