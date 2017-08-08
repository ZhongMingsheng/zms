package com.atguigu.phone.listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;


public class MyAppListener implements ServletContextListener {

    @Override
    public void contextDestroyed(ServletContextEvent arg0) {
        
    }

    @Override
    public void contextInitialized(ServletContextEvent arg0) {
        ServletContext servletContext=arg0.getServletContext();
        servletContext.setAttribute("ctp", servletContext.getContextPath());
    }

}
