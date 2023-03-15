package cn.geek51.dao;

import cn.geek51.domain.Employee;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MyMapper {
//    TODO 根据部门id查询
    List<Employee> selectByDepartmentId(@Param("department") Integer departmentId);
}
