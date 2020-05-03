package com.xiongliang;

/**
 * 类的构造方法切入
 */
public aspect ConstructAop {
    /**
     * 切入Test的构造函数,调用时
     */
    pointcut callConstructPointcut():
            call(Test.new());

    /**
     * 切入Test的构造函数，执行时
     */
    pointcut executeConstructPointcut():
            execution(Test.new());

    /**
     * 切入Test对象 被初始化
     */
    pointcut initPointcut():
            initialization(Test.new());

    /**
     * Test类初始化
     */
    pointcut initStaticPointcut():
            staticinitialization(Test);


    before():callConstructPointcut(){
        System.out.println("构造函数被调用"+ thisJoinPoint.getSignature());
    }

    before():executeConstructPointcut(){
        System.out.println("构造函数执行"+ thisJoinPoint.getSignature());
    }

    before():initPointcut(){
        System.out.println("Test对象被初始化="+thisJoinPoint.getSignature());
    }

    before():initStaticPointcut(){
        System.out.println("Test类被初始化="+thisJoinPoint.getSignature());
    }
}
