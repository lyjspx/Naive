/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package testspeed;

/**
 *
 * @author x
 */
public class TestSpeed {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       double startTime1 = System.currentTimeMillis();
       double[][] a = new double[10000][10000];
       for(int i = 0; i < 10000; i++){
           for(int j = 0; j < 10000;j++){
               a[i][j] = Math.pow(-1, i+j);
           }
       }
       double endTime1 = System.currentTimeMillis();
       double time1 = endTime1 - startTime1;
       System.out.println("Option 1 (using power method): " + time1 );
       
       double startTime2 = System.currentTimeMillis();
       double[][] b = new double[10000][10000];
       for(int i = 0; i < 10000; i++){
           for(int j = 0; j < 10000;j++){
               if (((i+j) % 2) == 0) b[i][j] = 1;
               else b[i][j] = -1;
           }
       }
       double endTime2 = System.currentTimeMillis();
       double time2 = endTime2 - startTime2;
       System.out.println("Option 2 (using mod method): " + time2 );
    }
    
}
