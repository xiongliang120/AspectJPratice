package com.xiongliang;

import org.aspectj.lang.JoinPoint;

/**
 * 捕获通知的执行
 */
public aspect AdviceAop {
    /***
     * 捕获通知被调用的地方, 非AdviceAop 类及其子类
     */
    pointcut advicePointcut():
            adviceexecution() && !within(AdviceAop+);

    /***
     * 捕获通知被调用的地方, 非AdviceAop 类及其子类, 并获取参数
     */
    pointcut adviceParamPointcut(JoinPoint originalJoinPoint):
            adviceexecution() && args(originalJoinPoint) &&!within(AdviceAop+);


    before():advicePointcut(){
         System.out.println("通知被调用 "+thisJoinPoint.getSignature());
    }

    //没有起作用????
    before(JoinPoint originalJoinPoint):adviceParamPointcut(originalJoinPoint){
        System.out.println("通知被调用 参数="+originalJoinPoint.getSignature());
    }

}
