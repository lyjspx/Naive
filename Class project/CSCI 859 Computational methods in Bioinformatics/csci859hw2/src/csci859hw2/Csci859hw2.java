/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package csci859hw2;

import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author x
 */
public class Csci859hw2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) throws FileNotFoundException {
        File file = new File("set83.txt");
        Scanner scan = new Scanner(file);
        ArrayList<String> allLine = new <String>ArrayList();
         while(scan.hasNextLine()){
            allLine.add(scan.nextLine());
        }
        String[] aaName = new String[83];
        String[] aaSeq = new String[83];
        String[] aaState = new String[83];
        for(int i = 0; i < 332; i = i + 4){
            aaName[i%83] = (String) allLine.get(i);
            aaSeq[i%83] = (String) allLine.get(i+1);
            aaState[i%83] = (String) allLine.get(i+2);
            }
        ArrayList<int[]> state4 = new <int[]>ArrayList();
        for(int i = 0; i < 83; i++ ){
            state4.add(ConvertState(aaState[i]));
        }
        
        System.out.println(aaName.length + " proteins in the dataset");
        
        int[][] emitNum = new int[4][19];
        for(int i = 0; i < 83; i++){
            int[][] temp = CalculEmit(aaSeq[i], state4.get(i));
            for(int j = 0; j < 4;j++){
                for(int k = 0; k < 19; k++){
                    emitNum[j][k] += temp[j][k];
                }
            }
        }
        
        int[] tranNum = new int[8];
        for(int i = 0; i < 83; i++){
            int[] temp = CalculTran(state4.get(i));
            for(int j = 0; j < 4;j++){
                    tranNum[j] += temp[j];
            }
        }
        
        double[][] finalEmit = TrainModelEmit(emitNum);
        double[] finalTran = TrainModelTran(tranNum);
        System.out.println(StateGeneration(aaSeq[0], state4.get(0), finalEmit, finalTran));
    }
    
    public static int[] ConvertState(String state){
        int[] result = new int[state.length()];
        for(int i = 0 ; i < state.length(); i++){
            if(state.charAt(i) == 'O') result[i] = 0;
            else if(state.charAt(i) == 'I') result[i] = 2;
            else if(state.charAt(i) == 'H') {
                if(state.charAt(i-1) == 'O') result[i] = 1;
                else if(state.charAt(i) == 'I') result[i] = 3;
                else result[i] = result[i-1];
            }
        }
        return result;
    }
    public static int[][] CalculEmit(String sequence, int[] state){
        int[][] emissionNum = new int[4][19];
        for(int i = 0; i < sequence.length();i ++){
            if(sequence.charAt(i) == 'A') emissionNum[state[i]][0] ++;
            else if(sequence.charAt(i) == 'C') emissionNum[state[i]][1] ++;
            else if(sequence.charAt(i) == 'D') emissionNum[state[i]][2] ++;
            else if(sequence.charAt(i) == 'E') emissionNum[state[i]][3] ++;
            else if(sequence.charAt(i) == 'F') emissionNum[state[i]][4] ++;
            else if(sequence.charAt(i) == 'G') emissionNum[state[i]][5] ++;
            else if(sequence.charAt(i) == 'H') emissionNum[state[i]][6] ++;
            else if(sequence.charAt(i) == 'I') emissionNum[state[i]][7] ++;
            else if(sequence.charAt(i) == 'K') emissionNum[state[i]][8] ++;
            else if(sequence.charAt(i) == 'L') emissionNum[state[i]][9] ++;
            else if(sequence.charAt(i) == 'N') emissionNum[state[i]][10] ++;
            else if(sequence.charAt(i) == 'P') emissionNum[state[i]][11] ++;
            else if(sequence.charAt(i) == 'Q') emissionNum[state[i]][12] ++;
            else if(sequence.charAt(i) == 'R') emissionNum[state[i]][13] ++;
            else if(sequence.charAt(i) == 'S') emissionNum[state[i]][14] ++;
            else if(sequence.charAt(i) == 'T') emissionNum[state[i]][15] ++;
            else if(sequence.charAt(i) == 'V') emissionNum[state[i]][16] ++;
            else if(sequence.charAt(i) == 'W') emissionNum[state[i]][17] ++;
            else if(sequence.charAt(i) == 'Y') emissionNum[state[i]][18] ++;
            else System.out.println("WRONG");
        }
        return emissionNum;
    } 
    public static int[] CalculTran(int[] state){
        int[] result= new int[8];
        for(int i = 0; i < state.length-1; i++){
            if(state[i] == 0 && state[i+1] == 0) result[0]++;
            else if(state[i] == 0 && state[i+1] == 1) result[1]++;
            else if(state[i] == 1 && state[i+1] == 1) result[2]++;
            else if(state[i] == 1 && state[i+1] == 2) result[3]++;
            else if(state[i] == 2 && state[i+1] == 2) result[4]++;
            else if(state[i] == 2 && state[i+1] == 3) result[5]++;
            else if(state[i] == 3 && state[i+1] == 3) result[6]++;
            else if(state[i] == 3 && state[i+1] == 0) result[7]++;
        }
        return result;
    }
    
    public static double[][] TrainModelEmit(int[][] emit){
       double[][] result = new double[4][19];
       for(int i = 0; i <4; i ++ ){
           int total = 0;
           for(int j =0; j < 19; j++){
               total += emit[i][j];
           }
           for(int j =0; j < 19; j++){
                result[i][j] = emit[i][j]/total;
           }
       }
       return result;
    }
    
    public static double[] TrainModelTran(int[] transition){
        double[] result = new double[8];
        int tempO = transition[0] + transition[1];  
        int tempY = transition[2] + transition[3];  
        int tempI = transition[4] + transition[5];  
        int tempX = transition[6] + transition[7];  
        
        result[0] = transition[0]/tempO;
        result[1] = transition[1]/tempO;
        result[2] = transition[2]/tempY;
        result[3] = transition[3]/tempY;
        result[4] = transition[4]/tempI;
        result[5] = transition[5]/tempI;
        result[6] = transition[6]/tempX;
        result[7] = transition[7]/tempX;
        
        return result;
    }
    public static int getIndex(char aa){
        int result = 0;
        if(aa == 'A') result = 0;
        else if(aa == 'C') result = 1;
        else if(aa == 'D') result = 2;
        else if(aa == 'E') result = 3;
        else if(aa == 'F') result = 4;
        else if(aa == 'G') result = 5;
        else if(aa == 'H') result = 6;
        else if(aa == 'I') result = 7;
        else if(aa == 'K') result = 8;
        else if(aa == 'L') result = 9;
        else if(aa == 'N') result = 10;
        else if(aa == 'P') result = 11;
        else if(aa == 'Q') result = 12;
        else if(aa == 'R') result = 13;
        else if(aa == 'S') result = 14;
        else if(aa == 'T') result = 15;
        else if(aa == 'V') result = 16;
        else if(aa == 'W') result = 17;
        else if(aa == 'Y') result = 18;
        else System.out.println("WRONG");
        
        return result;
    }
    
    
    public static double StateGeneration(String seq, int[] states, double[][] emitProb, double[] tranProb){
        double result;
        double[][] genProb = new double[4][seq.length()];
        genProb[0][0] = 20 * 0.5 * emitProb[0][0];
        genProb[1][0] = 20 * 0 * emitProb[1][0];
        genProb[2][0] = 20 * 0.5 * emitProb[2][0];
        genProb[3][0] = 20 * 0 * emitProb[3][0];
        
        for(int i = 1; i < seq.length(); i++){
            genProb[0][i] = 20 * emitProb[0][getIndex(seq.charAt(i))]*Math.max(genProb[0][i-1]*tranProb[0],genProb[3][i-1]*tranProb[7]);
            genProb[1][i] = 20 * emitProb[1][getIndex(seq.charAt(i))]*Math.max(genProb[1][i-1]*tranProb[2],genProb[0][i-1]*tranProb[1]);
            genProb[2][i] = 20 * emitProb[2][getIndex(seq.charAt(i))]*Math.max(genProb[2][i-1]*tranProb[4],genProb[1][i-1]*tranProb[3]);
            genProb[3][i] = 20 * emitProb[3][getIndex(seq.charAt(i))]*Math.max(genProb[3][i-1]*tranProb[6],genProb[2][i-1]*tranProb[5]);
        }
        
        int[][] traceList = new int[4][seq.length()];
        
        for(int i =0; i < 4; i++){
            int temp = i;
            for(int j =1; j < seq.length();j++){
                if(genProb[temp%4][j-1]*tranProb[temp] >= genProb[(temp+3)%4][j-1]*tranProb[(2*temp -1)%8]) traceList[i][j-1] = temp%4;
                else traceList[i][j-1] = (temp+3)%4;
            }
        }
        double max = 0.0;
        for(int i = 0; i < 4; i++){
            double temp = 0.0;
            for(int j = 0; j < seq.length()-1; j++){
                if(traceList[i][j] == states[j]) temp++;
            }
            temp = temp / (seq.length()-1);
            if (max < temp) max = temp;
        }
        result = max;
        return result;
    }
}
