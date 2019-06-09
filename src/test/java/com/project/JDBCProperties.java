package com.project;

import com.google.common.base.CaseFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author yuan
 * @date 2018/11/15 0015
 */
public class JDBCProperties {
    //JDBC配置，请修改为你项目的实际配置
    //public static final String JDBC_URL = "jdbc:mysql://127.0.0.1:3306/family?characterEncoding=utf8&useSSL=true";
    public static final String JDBC_URL = "jdbc:mysql://192.168.31.106:3306/skymall?characterEncoding=utf8&useSSL=true&serverTimezone=GMT%2B8";
    public static final String JDBC_USERNAME = "root";
    public static final String JDBC_PASSWORD = "root";
    public static final String JDBC_DIVER_CLASS_NAME = "com.mysql.cj.jdbc.Driver";
    public static final String PROJECT_PATH = System.getProperty("user.dir");//项目在硬盘上的基础路径
    public static final String TEMPLATE_FILE_PATH = PROJECT_PATH + "/src/test/resources/generator/template";//模板位置
    public static final String JAVA_PATH = "/src/main/java"; //java文件路径
    public static final String RESOURCES_PATH = "/src/main/resources";//资源文件路径
    public static final String PACKAGE_PATH_CONTROLLER = packageConvertPath(ProjectConstant.CONTROLLER_PACKAGE);//生成的Controller存放路径
    public static final String PACKAGE_PATH_SERVICE = packageConvertPath(ProjectConstant.SERVICE_PACKAGE);//生成的Service存放路径
    public static final String PACKAGE_PATH_UTIL = packageConvertPath(ProjectConstant.UTIL_PACKAGE);//生成的Utils存放路径
    public static final String PACKAGE_PATH_JS = packageConvertPath(ProjectConstant.JS_PACKAGE);//生成的JS存放路径
    public static final String PACKAGE_PATH_VIEW = packageConvertPath(ProjectConstant.VIEW_PACKAGE);//生成LayUi视图的存放路径
    public static final String PACKAGE_PATH_POJO = packageConvertPath(ProjectConstant.MODEL_PACKAGE);//生成POJO视图的存放路径
    public static final String PACKAGE_PATH_MAPPER = packageConvertPath(ProjectConstant.MAPPER_PACKAGE);//生成POJO视图的存放路径
    public static final String PACKAGE_PATH_VUE_LIST = packageConvertPath(ProjectConstant.VUE_PACKAGE);//生成VueTable的存放路径

    public static final String AUTHOR = "xiaodong";//@author
    public static final String DATE = new SimpleDateFormat("yyyy/MM/dd").format(new Date());//@date

    public static String tableNameConvertLowerCamel(String tableName) {
        return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, tableName.toLowerCase());
    }

    public static String tableNameConvertUpperCamel(String tableName) {
        return CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.UPPER_CAMEL, tableName.toLowerCase());

    }

    public static String tableNameConvertMappingPath(String tableName) {
        tableName = tableName.toLowerCase();//兼容使用大写的表名
        return "/" + (tableName.contains("_") ? tableName.replaceAll("_", "/") : tableName);
    }

    public static String modelNameConvertMappingPath(String modelName) {
        String tableName = CaseFormat.UPPER_CAMEL.to(CaseFormat.LOWER_UNDERSCORE, modelName);
        return tableNameConvertMappingPath(tableName);
    }

    public static String packageConvertPath(String packageName) {
        return String.format("/%s/", packageName.contains(".") ? packageName.replaceAll("\\.", "/") : packageName);
    }
}
