package com.xiongliang;

/**
 * 捕获通知的执行
 */
public aspect AdviceAop {
    /***
     * 捕获通知被调用的地方, 非AdviceAop 类及其子类
     */
    pointcut advicePointcut():
            adviceexecution() && !within(AdviceAop+);

    before():advicePointcut(){
         System.out.println("通知被调用");
    }
}
