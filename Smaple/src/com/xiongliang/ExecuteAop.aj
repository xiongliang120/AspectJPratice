package com.xiongliang;

public aspect ExecuteAop {
    /******************** 执行方法切入***********************/
    /**
     * execute, 切入方法执行中的连接点
     */
    pointcut executePointcut():
            execution(void com.xiongliang.Test.getPeople(java.lang.String,int));


    pointcut executePointcutTarget(Test object):
            execution(void com.xiongliang.Test.getPeople(java.lang.String,int)) &&
                    target(object);



    before(): executePointcut(){
        System.out.println("切入有参函数,在方法执行前调用");
    }

    before(Test object): executePointcutTarget(object){
        System.out.println("切入有参函数,在方法执行前调用 object="+object);
    }

}
