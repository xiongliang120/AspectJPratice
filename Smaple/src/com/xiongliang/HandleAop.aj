package com.xiongliang;

public aspect HandleAop {
    /**
     * 捕获Exception 异常, 也可以执行MyException等
     */
    pointcut handleCut():
            handler(Exception);

    /**
     * 捕获Exception 异常, 并且绑定exception 对象
     */
    pointcut handleCutParam(Exception exception):
            handler(Exception) && args(exception);

    /**
     * 捕获Exception 异常,并获取捕获异常所在类的对象, 通过this指定，target 不行
     */
    pointcut handleCurTarget(Test object):
            handler(Exception) && this(object);

    before():handleCut(){
        System.out.println("捕获catch 异常");
    }

    before(Exception exception):handleCutParam(exception){
        System.out.println("捕获到catch异常 exception="+exception.getMessage());
    }

    before(Test object):handleCurTarget(object){
        System.out.println("捕获catch 异常的对象object="+object);
    }

}
