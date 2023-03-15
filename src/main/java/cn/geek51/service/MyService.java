package cn.geek51.service;

import cn.geek51.domain.Employee;

import java.util.List;

public interface MyService {
    List<Employee> selectByDepartmentId(Integer departmentId);
}
