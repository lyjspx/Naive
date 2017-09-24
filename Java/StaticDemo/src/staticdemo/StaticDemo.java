/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staticdemo;

import static staticdemo.math.staticPlus;

/**
 *
 * @author x
 */
public class StaticDemo {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int i = 10;
        int j = 11;
        
        math Caculator = new math(i,j);
        
       System.out.println(Caculator.noneStaticPlus());
       
       System.out.println(staticPlus(i,j));
        
       System.out.println(Caculator.getCount());
       
       math object2 = new math(i,j);
       math object3 = new math(i,j);
       System.out.println(object3.getCount());
    }
    
}
