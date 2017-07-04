package com.tool;
import java.text.SimpleDateFormat;
import java.util.Calendar;

public class EntityIDFactory {

	private static final SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
	private static String preId = "";
	
	public static synchronized String createId(){
		String id = format.format(Calendar.getInstance().getTime());
		while(id.equals(preId)){
			id = format.format(Calendar.getInstance().getTime());
		}
		preId = id;
		return id;
	}

	public static synchronized String createSuId(){
		String id = format.format(Calendar.getInstance().getTime());
		while(id.equals(preId)){
			id = format.format(Calendar.getInstance().getTime());
		}
		return "SU"+id;
	}
	
	/*
	 * 2015.07.29
	 * 为方便原因码生成动态编码
	 * */
	//private static final String prefix = "YYM";
	//生成动态编码
	public static synchronized String createCode(String prefix){
		String time = format.format(Calendar.getInstance().getTime());
		return prefix+""+time;
	}
}
