package com.xiongliang;

public aspect OneAop {
    /**
     * 切入无返回，无参方法
     */
    pointcut callPointcut():
            call(void com.xiongliang.Test.test());
    /**
     * args(name,age), 可以将切入点的标识符绑定到方法参数上
     */
    pointcut callParamPoincut(String name,int age):
            call(void com.xiongliang.Test.getPeople(String,int)) &&
            args(name,age);

    /**
     * target(object),将getPeople()调用对象绑定到object变量上
     */
    pointcut callParamPointcutTarget(Test object):
            call(void com.xiongliang.Test.getPeople(String,int)) &&
                    target(object);


    before(): callPointcut(){
        System.out.println("切入无参无返回值方法");
    }

    before(String name,int age): callParamPoincut(name,age){
        System.out.println("切入有参函数,并获取参数 name="+name+"age="+age);
    }

    before(Test object): callParamPointcutTarget(object){
        System.out.println("切入有参函数,并获取调用该方法的对象 object="+object);
        object.test();
    }
}
