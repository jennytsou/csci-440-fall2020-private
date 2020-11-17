package edu.montana.csci.csci440.helpers;

import edu.montana.csci.csci440.model.Employee;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import redis.clients.jedis.Jedis;

public class EmployeeHelper {
    public static String makeEmployeeTree() {
        // TODO, change this to use a single query operation to get all employees
        Employee employee = Employee.find(1); // root employee

        // and use this data structure to maintain reference information needed to build the tree structure
        Map<Long, List<Employee>> reportsToMap = new HashMap<>();
        for (Employee emp : Employee.all()) {
            long reportsTo = emp.getReportsTo();

            List<Employee> employeeReportsToList = reportsToMap.get(reportsTo);
            if ( employeeReportsToList == null) {
                employeeReportsToList = new LinkedList<>();
                reportsToMap.put(reportsTo, employeeReportsToList);
            }
            employeeReportsToList.add(emp);
        }


        return "<ul>" + makeTree(employee, reportsToMap) + "</ul>";
    }

    // TODO - currently this method just usese the employee.getReports() function, which
    //  issues a query.  Change that to use the employeeMap variable instead
    public static String makeTree(Employee employee, Map<Long, List<Employee>> employeeMap) {
        String list = "<li><a href='/employees" + employee.getEmployeeId() + "'>"
                + employee.getEmail() + "</a><ul>";
     //   List<Employee> reports = employee.getReports();
        List<Employee> reports = employeeMap.get(employee.getEmployeeId());
        if ( reports != null) {
            for (Employee report : reports) {
                list += makeTree(report, employeeMap);
            }
        }
        return list + "</ul></li>";
    }
}
