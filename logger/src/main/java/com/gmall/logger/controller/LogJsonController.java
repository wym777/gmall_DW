package com.gmall.logger.controller;


import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class LogJsonController {




    private static final  org.slf4j.Logger logger = LoggerFactory.getLogger(LogJsonController.class) ;

    @PostMapping("/log")
    public void shipLog(@RequestParam("log") String log){
        JSONObject logJsonObj = JSON.parseObject(log);
        logJsonObj.put("ts",System.currentTimeMillis());
        String logNew = logJsonObj.toJSONString();
        logger.info(logNew);
        System.out.println(log);

        //发送 kafka
    }
}

