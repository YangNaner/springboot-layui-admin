package cn.geek51.controller;

import cn.geek51.service.MyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
//@RequestMapping("/employees")
public class MyController {
    @Autowired
    private MyService myService;

//    页面跳转
    @GetMapping("/select")
    public String index() {
        return "employee";
    }

//    根据部门id查询
    @GetMapping("/select/{departmentId}")
    @ResponseBody
    public List selectByDepartmentId(@PathVariable("departmentId") Integer departmentId) {

        return myService.selectByDepartmentId(departmentId);
    }

}
