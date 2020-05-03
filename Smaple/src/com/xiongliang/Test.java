package com.xiongliang;

public class Test {
    public static void main(String[] args) {
        Test test = new Test();
        test.test();
//        test.getPeople("熊",27);
        test.popCatch();
    }

    public void test(){
       System.out.println("com/xiongliang");
    }

    public void getPeople(String name,int age){
        System.out.println("name="+name+"age="+age);
    }

    public void popCatch(){
        try{
            int a = 9/0;
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}
