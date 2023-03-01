package org.fkjava.hrm.util.annotation;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;

@Retention(RetentionPolicy.RUNTIME)
public @interface AutoMapper {
    
	public boolean required() default true;
	
}
