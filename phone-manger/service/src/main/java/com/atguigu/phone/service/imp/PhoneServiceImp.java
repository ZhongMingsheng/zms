package com.atguigu.phone.service.imp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.phone.dao.TableCellphoneMapper;
import com.atguigu.phone.pojo.TableCellphone;
import com.atguigu.phone.service.PhoneService;

@Service
public class PhoneServiceImp implements PhoneService {
    @Autowired(required=false)
    TableCellphoneMapper cellphoneMapper;
    @Override
    public List<TableCellphone> list() {
        System.out.println(cellphoneMapper);
        return cellphoneMapper.selectByExample(null);
    }

}
