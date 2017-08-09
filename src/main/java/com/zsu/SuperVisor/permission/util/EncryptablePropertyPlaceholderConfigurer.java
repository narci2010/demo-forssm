package com.zsu.SuperVisor.permission.util;

import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;

import com.zsu.SuperVisor.permission.Constants;

/**
 * <p>
 * User: Narci Lee
 * <p>
 * Date: 17-7-27
 * <p>
 * Version: 1.0
 */
public class EncryptablePropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
	private String[] encryptPropNames = { Constants.JDBC_DATASOURCE_USERNAME_KEY,
			Constants.JDBC_DATASOURCE_PASSWORD_KEY };

	@Override
	protected String convertProperty(String propertyName, String propertyValue) {

		// 如果在加密属性名单中发现该属性
		if (isEncryptProp(propertyName)) {
			String decryptValue = DESUtils.getDecryptString(propertyValue);
			return decryptValue;
		} else {
			return propertyValue;
		}

	}

	private boolean isEncryptProp(String propertyName) {
		for (String encryptName : encryptPropNames) {
			if (encryptName.equals(propertyName)) {
				return true;
			}
		}
		return false;
	}
}