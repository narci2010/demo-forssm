package com.zsu.SuperVisor.permission.util;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import com.zsu.SuperVisor.permission.Constants;

/**
 * <p>
 * 绑定当前登录的用户
 * </p>
 * <p>
 * 不同于@ModelAttribute
 * </p>
 *
 * @author Narci Lee
 */
@Target({ ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface CurrentUser {

	/**
	 * 当前用户在request中的名字
	 *
	 * @return
	 */
	String value() default Constants.CURRENT_USER;

}
