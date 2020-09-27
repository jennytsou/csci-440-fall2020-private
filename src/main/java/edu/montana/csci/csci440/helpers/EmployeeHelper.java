package edu.montana.csci.csci440.helpers;

import edu.montana.csci.csci440.model.Employee;

import java.util.List;

public class EmployeeHelper {
    public static String makeTreeRoot(Employee employee) {
        return "<ul>" + makeTree(employee) + "</ul>";
    }
    public static String makeTree(Employee employee) {
        String list = "<li><a href='/employees" + employee.getEmployeeId() + "'>"
                + employee.getEmail() + "</a><ul>";
        List<Employee> reports = employee.getReports();
        for (Employee report : reports) {
            list += makeTree(report);
        }
        return list + "</ul></li>";
    }
}
