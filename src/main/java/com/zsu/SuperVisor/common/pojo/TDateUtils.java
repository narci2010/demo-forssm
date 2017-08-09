package com.zsu.SuperVisor.common.pojo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TDateUtils {
	private static String formateStyle = "yyyy-MM-dd hh:MM:mm";
	private static SimpleDateFormat format = new SimpleDateFormat(formateStyle);

	public static String formateDate(Date date){
	String dd = format.format(date);
	return dd;
	}
	public static void main(String[] args) {
		 
		String ss=formateDate(new Date());
		System.out.println(ss);
		
	}
	}


