package com.tool;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class ListFile {

	public List<String> listJavaFile(String fileName) {    
        File file = new File(fileName);    
        List<String> list = new ArrayList<String>();
        if (file.isDirectory()) {    
            File[] files = file.listFiles();    
            for (int i = 0; i < files.length; i++) {    
                String name = files[i].getName();    
                if (name.trim().toLowerCase().endsWith(".java")) {    
                	list.add(name.substring(0, name.length()-5));
                }    
                if (files[i].isDirectory()) {    
                    String path = files[i].getPath();    
                    listJavaFile(path);    
                }    
            }    
        }
		return list;    
    }    
	
	public static void main(String[] args) {  
        // TODO Auto-generated method stub  
        ListFile listfile = new ListFile();  
        List<String> list = listfile.listJavaFile("E:\\高级java作业\\QWB\\src\\com\\entity");
        for(String str:list)
        	System.out.println(str);
    } 
	
}
