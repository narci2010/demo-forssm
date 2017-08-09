package com.zsu.SuperVisor.common.pojo;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Field;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class ExcelUtils {

	// 通用导出功能
	public static void excelOut(ArrayList ary, String dirPath, String filename) {
		WritableWorkbook workbook = null;
		File path = new File(dirPath);
		if (!path.exists()) {

			path.mkdir();
		}
		File file = new File(dirPath + "/" + filename);
		if (!file.exists()) {
			try {
				file.createNewFile();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		try {
			workbook = Workbook.createWorkbook(file);

			WritableSheet sheet = workbook.createSheet("sheet1", 0);

			for (int i = 0; i < ary.size(); i++) {
				Object obj = ary.get(i);
				Class cls = obj.getClass();
				Field[] fields = cls.getDeclaredFields();
				for (int j = 0; j < fields.length; j++) {
					Field field = fields[j];
					field.setAccessible(true);

					if (field.getType().getName().equals("double")) {
						sheet.addCell(new Label(j, i+1, String.valueOf(field.getDouble(obj))));
					} else if (field.getType().getName().equals("int")) {
						sheet.addCell(new Label(j, i+1, String.valueOf(field.getInt(obj))));
					}
					else if (field.getType().getName().equals("java.util.Date")) {
						sheet.addCell(new Label(j, i+1, 
								
								//String.valueOf(field.get(obj)(obj)))
							String.valueOf(TDateUtils.formateDate((Date)field.get(obj)))	
								));
					}
					else {
						sheet.addCell(new Label(j, i+1, String.valueOf(field.get(obj))));
					}
				}

			}
			workbook.write();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				workbook.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static ArrayList excelIn(Class cls, String filepath) {
		ArrayList ary = new ArrayList();
		Workbook workbook = null;
		try {
			workbook = Workbook.getWorkbook(new File(filepath));
			Sheet sheet = workbook.getSheet(0);
			for (int i = 1; i < sheet.getRows(); i++) {

				Object obj = cls.newInstance();
				Field[] fields = cls.getDeclaredFields();
				for (int j = 0; j < fields.length; j++) {
					Field field = fields[j];
					Cell cell = sheet.getCell(j, i);
					field.setAccessible(true);
					System.out.println(field.getType().getName());
					if (field.getType().getName().equals("java.lang.Integer")) {
						field.set(obj, new Integer(cell.getContents()));

					} else if (field.getType().getName().equals("java.math.BigDecimal")) {

						field.set(obj, new BigDecimal((cell.getContents())));
					} else if (field.getType().getName().equals("java.util.Date")) {

						field.set(obj,
								DateUtils.parseDate(cell.getContents(), "yyyy-MM-dd hh:MM:mm")

						);
					} else {
						field.set(obj, String.valueOf(cell.getContents()));
					}
				}
				ary.add(obj);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			workbook.close();
		}
		return ary;
	}

	public static void main(String[] args) {
		Date dd = null;
		try {
			dd = DateUtils.parseDate("2017-06-12 15:43:20", "yyyy-MM-dd hh:MM:mm");
			System.out.println(dd);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// ArrayList ary = new ArrayList();
		// for (int i = 0; i < 10; i++) {
		// Book book = new Book();
		// book.setId(i);
		// book.setName("西游记");
		// book.setTitle("呵呵");
		// ary.add(book);
		// }
		// excelOut(ary, "D:/good", "book.xls");

		// ArrayList list = excelIn(Book.class, "D:/good/book.xls");
		// for (Object object : list) {
		// Book book = (Book)object;
		// System.out.println(book.getId() + ":" + book.getName() + ":" +
		// book.getPrice() + ":" + book.getTitle());
		// }

	}
}
