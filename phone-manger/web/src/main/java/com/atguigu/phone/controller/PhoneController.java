package com.atguigu.phone.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.atguigu.phone.pojo.TableCellphone;
import com.atguigu.phone.service.PhoneService;

@Controller
public class PhoneController {
    @Autowired(required=false)
    PhoneService phoneService;
    @RequestMapping("/list")
    @ResponseBody
    public List<TableCellphone> list(){
        System.out.println("dsfsf");
        List<TableCellphone> list=phoneService.list();
        return list;
    }
    
}
