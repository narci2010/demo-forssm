package com.zsu.SuperVisor.permission.util;

import java.security.Key;
import java.security.SecureRandom;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;

import org.apache.shiro.codec.Base64;

import com.zsu.SuperVisor.permission.Constants;



/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-7-27
 * <p>
 * Version: 1.0
 */
public class DESUtils {
	private static Key key;  
    private static String KEY_STR=Constants.JDBC_DESC_KEY;  
      
    static{  
        try  
        {  
            KeyGenerator generator = KeyGenerator.getInstance("DES");  
            SecureRandom secureRandom=SecureRandom.getInstance("SHA1PRNG");  
            secureRandom.setSeed(KEY_STR.getBytes());  
            generator.init(secureRandom);  
            key = generator.generateKey();  
            generator=null;  
        }  
        catch (Exception e)  
        {  
            throw new RuntimeException(e);  
        }  
    }  
      
    /** 
     * 对字符串进行加密，返回BASE64的加密字符串 
     * <功能详细描述> 
     * @param str 
     * @return 
     * @see [类、类#方法、类#成员] 
     */  
    public static String getEncryptString(String str){  
    	Base64 base64Encoder = new Base64();  
        System.out.println(key);  
        try  
        {  
            byte[] strBytes = str.getBytes("UTF-8");  
            Cipher cipher = Cipher.getInstance("DES");  
            cipher.init(Cipher.ENCRYPT_MODE, key);  
            byte[] encryptStrBytes = cipher.doFinal(strBytes);  
            return base64Encoder.encodeToString(encryptStrBytes);  
        }  
        catch (Exception e)  
        {  
            throw new RuntimeException(e);  
        }  
          
    }  
      
    /** 
     * 对BASE64加密字符串进行解密 
     * <功能详细描述> 
     * @param str 
     * @return 
     * @see [类、类#方法、类#成员] 
     */  
    public static String getDecryptString(String str){  
    	Base64 base64Decoder = new Base64();  
        try  
        {  
            byte[] strBytes = base64Decoder.decode(str);
            Cipher cipher = Cipher.getInstance("DES");  
            cipher.init(Cipher.DECRYPT_MODE, key);  
            byte[] encryptStrBytes = cipher.doFinal(strBytes);  
            return new String(encryptStrBytes,"UTF-8");  
        }  
        catch (Exception e)  
        {  
            throw new RuntimeException(e);  
        }  
          
    }  
      
      
    public static void main(String[] args)  
    {  
        String name ="root";  
        String password="tocean788";  
        String encryname = getEncryptString(name);  
        String encrypassword = getEncryptString(password);  
        System.out.println(encryname);  
        System.out.println(encrypassword);  
          
        System.out.println(getDecryptString(encryname));  
        System.out.println(getDecryptString(encrypassword));  
    }  
}
