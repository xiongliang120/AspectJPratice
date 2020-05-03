package com.xiongliang;

import javax.management.remote.MBeanServerForwarder;

public aspect AttributeAop {
    /**
     * 切入 Test 获取name属性的值
     */
    pointcut getAttributePointcut():
            get(String Test.name);

    /**
     * 切入 Test 获取age属性的值,static final ???
     */
    pointcut getStaticAttributePointcut():
            get(public static final String Constrant.age);

    /**
     * 切入 Test 设置name属性的值
      */
    pointcut setAttributePointcut():
            set(String Test.name);

    /**
     * 切入Test 设置name后的新值
     */
    pointcut setAttributeReturnPointcut(String newname):
            set(Stringg Test.name) && args(newname);


    before():getAttributePointcut(){
        System.out.println("Test 访问name属性"+thisJoinPoint.getSignature());
    }

    before():getStaticAttributePointcut(){
        System.out.println("Test 访问静态age属性"+thisJoinPoint.getSignature());
    }

    before():setAttributePointcut(){
        System.out.println("Test 设置属性name"+thisJoinPoint.getSignature());
    }

    /***
     * 获取get属性值
     */
    after() returning(String name):getAttributePointcut(){
          System.out.println("Test 访问name属性 name="+ name);
    }

    /***
     * 获取set 属性后的新值
     */
    before(String newname):setAttributeReturnPointcut(newname){
        System.out.println("Test 设置name属性后的新值="+newname);
    }

}
