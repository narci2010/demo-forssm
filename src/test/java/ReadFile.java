import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.HashMap;

import org.apache.commons.lang3.CharUtils;
import org.apache.commons.lang3.StringUtils;

public class ReadFile {
	public ReadFile() {

	}

	public static void main(String[] args) throws Exception {
		 HashMap<String, Object> table = new HashMap<String, Object>(); 
		testFileReader("D:/demo/CourseGroupController.java", "PaymentInfo","paymentInfo");
		testFileReader("D:/demo/CourseGroupService.java", "PaymentInfo","paymentInfo");
		testFileReader("D:/demo/TestCourseGroup.java", "PaymentInfo","paymentInfo");
//		
//		System.out.println("done");
		//System.out.println(fieldToProperty("suer_user"));
		//testFileReaderSql("D:/demo/sql.txt", "t_course_info","CourseInfo");
		//System.out.println("done");
		//testFileReaderViewSql("D:/demo/viewSql.txt");
		//System.out.println("done");
//		testFileReaderResultMapSql("D:/demo/viewSql.txt");
//		System.out.println("done");
		
		
	}
    public static void createSql(String tableName,String Object){
    	
    	
    	
    	
    }
    /** 
     * 字段转换成对象属性 例如：user_name to userName 
     * @param field 
     * @return 
     */  
    public static String fieldToProperty(String field) {  
        if (null == field) {  
            return "";  
        }  
        char[] chars = field.toCharArray();  
        StringBuffer sb = new StringBuffer();  
        for (int i = 0; i < chars.length; i++) {  
            char c = chars[i];  
            if (c == '_') {  
                int j = i + 1;  
                if (j < chars.length) {  
                    sb.append(StringUtils.upperCase(CharUtils.toString(chars[j])));  
                    i++;  
                }  
            } else {  
                sb.append(c);  
            }  
        }  
        return sb.toString();  
    }  
	public static String StrReplace(String rStr, String rFix, String rRep) {
		int l = 0;
		String gRtnStr = rStr;
		do {
			l = rStr.indexOf(rFix, l);
			if (l == -1)
				break;
			gRtnStr = rStr.substring(0, l) + rRep + rStr.substring(l + rFix.length());
			l += rRep.length();
			rStr = gRtnStr;
		} while (true);
		return gRtnStr.substring(0, gRtnStr.length());
	}

	public static void testFileReader(String readerAddress, String ClassName, String ObjectName)
			throws IOException {
		String writeAddress=StrReplace(readerAddress,"CourseGroup",ClassName);
		writeAddress=StrReplace(writeAddress,"demo/","demo/target/");
		FileReader reader = new FileReader(readerAddress);
		FileWriter writer = new FileWriter(writeAddress);

		BufferedReader bReader = new BufferedReader(reader);
		BufferedWriter bWriter = new BufferedWriter(writer);

		String temp = "";
		while ((temp = bReader.readLine()) != null) {
			String str=StrReplace(temp,"CourseGroup",ClassName);
			str=StrReplace(str,"courseGroup",ObjectName);
			str=StrReplace(str,"public"," public");
			bWriter.write(str);
		}
		bWriter.flush();
		bWriter.close();
		bReader.close();
	}
	public static void testFileReaderSql(String readerAddress, String ClassName, String ObjectName)
			throws IOException {
		//String writeAddress=StrReplace(readerAddress,"CourseGroup",ClassName);
		String writeAddress=StrReplace(readerAddress,"demo/","demo/target/");
		FileReader reader = new FileReader(readerAddress);
		FileWriter writer = new FileWriter(writeAddress);

		BufferedReader bReader = new BufferedReader(reader);
		BufferedWriter bWriter = new BufferedWriter(writer);

		String temp = "";
		while ((temp = bReader.readLine()) != null) {
			String str=StrReplace(temp,"t_supervisor_info",ClassName);
			str=StrReplace(str,"SupervisorInfo",ObjectName);
			str=StrReplace(str,"<if test=\""," <if test=\"item.");
			if(str.endsWith(",")){
				str=str.substring(0,str.length()-1);
				String tempt=fieldToProperty(str).trim();
				str="and "+str+" like CONCAT('%', #{item."+tempt+",jdbcType=VARCHAR}, '%')";
				//like CONCAT('%', #{item.department,jdbcType=VARCHAR}, '%')
				
			}
			bWriter.write(str);
		}
		bWriter.flush();
		bWriter.close();
		bReader.close();
	}
	public static void testFileReaderViewSql(String readerAddress)
			throws IOException {
		//String writeAddress=StrReplace(readerAddress,"CourseGroup",ClassName);
		String writeAddress=StrReplace(readerAddress,"demo/","demo/target/");
		FileReader reader = new FileReader(readerAddress);
		FileWriter writer = new FileWriter(writeAddress);

		BufferedReader bReader = new BufferedReader(reader);
		BufferedWriter bWriter = new BufferedWriter(writer);

		String temp = "";
		while ((temp = bReader.readLine()) != null) {

			if(temp.indexOf(".")!=-1 && temp.indexOf(",")!=-1){
				String tempt=temp.substring(temp.indexOf(".")+1, temp.indexOf(",")).trim();
				temp=StrReplace(temp,tempt,tempt+" "+fieldToProperty(tempt));
				

			}
			bWriter.write(temp);
		}
		bWriter.flush();
		bWriter.close();
		bReader.close();
	}
	public static void testFileReaderResultMapSql(String readerAddress)
			throws IOException {
		//String writeAddress=StrReplace(readerAddress,"CourseGroup",ClassName);
		String writeAddress=StrReplace(readerAddress,"demo/","demo/target/");
		FileReader reader = new FileReader(readerAddress);
		FileWriter writer = new FileWriter(writeAddress);

		BufferedReader bReader = new BufferedReader(reader);
		BufferedWriter bWriter = new BufferedWriter(writer);

		String temp = "";
		while ((temp = bReader.readLine()) != null) {
           //<result column="username" property="username" jdbcType="VARCHAR" />
			if(temp.indexOf(".")!=-1 && temp.indexOf(",")!=-1){
				String tempt=temp.substring(temp.indexOf(".")+1, temp.indexOf(",")).trim();
				//temp=StrReplace(temp,tempt,tempt+" "+fieldToProperty(tempt));
				temp="<result column=\""+tempt+"\" property=\""+fieldToProperty(tempt)+"\" jdbcType=\"VARCHAR\" />";
				
				bWriter.write(temp);
			}
			
		}
		bWriter.flush();
		bWriter.close();
		bReader.close();
	}

}
