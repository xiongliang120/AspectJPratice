package com.xiongliang;

public aspect AnnotationAop {
    pointcut annotationCut():
            @annotation(Deprecated);

    before():annotationCut(){
        System.out.println("切入注解"+thisJoinPoint.getSignature());
    }
}
