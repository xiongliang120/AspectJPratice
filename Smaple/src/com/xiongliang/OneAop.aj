package com.xiongliang;

public aspect OneAop {
    pointcut callPointcut():
            call(void com.xiongliang.Test.test());

    before(): callPointcut(){
        System.out.println("hello world");
    }
}
