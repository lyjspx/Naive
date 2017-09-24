/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package staticdemo;

/**
 *
 * @author x
 */
public class math {
    int x;
    int y;
    static int count =0;
    
    public math(int X, int Y){
        x = X;
        y = Y;
        count ++;
    }
    
    public int noneStaticPlus(){
       return x+y; 
    }
    
    public static int staticPlus(int a, int b){
        return a+b;
        
    }
    
    public int getX(){
        return x;
    }
    public int getCount(){
        return count;
    }
    
    
}
