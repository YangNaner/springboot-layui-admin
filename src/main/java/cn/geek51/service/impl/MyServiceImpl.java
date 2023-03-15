package cn.geek51.service.impl;

import cn.geek51.dao.MyMapper;
import cn.geek51.domain.Employee;
import cn.geek51.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MyServiceImpl implements MyService {


    @Autowired
    private MyMapper myMapper;

    @Override
    public List<Employee> selectByDepartmentId(Integer departmentId) {
        return myMapper.selectByDepartmentId(departmentId);
    }
}
