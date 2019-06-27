/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package alignment_12_27;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

/**
 *
 * @author Yuan Liu
 */
public class Alignment_12_27 {

    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException, IOException {
       String file_name;
        file_name = args[0];
        
       //System.out.println("File name: ");
       //Scanner scan = new Scanner(System.in);
      // file_name = scan.nextLine();
       System.out.println(file_name);
      
      String outputFile = args[1]; 
      File file = new File(outputFile);
      FileWriter fileWriter = new FileWriter(file.getAbsolutePath());
      BufferedWriter bw = new BufferedWriter(fileWriter);
       // Open the file
       FileInputStream fstream = new FileInputStream(file_name);
       String currentSeq = "";
       int num = 1;
               
       try (BufferedReader br = new BufferedReader(new InputStreamReader(fstream))){
            String strLine;
            //Read File Line By Line
            while ((strLine = br.readLine()) != null) {
                if(num % 200000 == 0) System.out.println(num + "has processed");
                if(strLine.charAt(0)=='@'){}
                else{
                    Scanner temp = new Scanner(strLine).useDelimiter("\t");
                    
                    String trim = temp.next();
                    trim = trim.substring(7);
                    //System.out.println(trim);
                    //System.out.println(currentSeq);
                    temp.next();
                    String loc = temp.next();
                    //System.out.println(next);
                    if(currentSeq.equals(trim))
                        bw.append("\t"+loc);
                    else{
                        currentSeq = trim;
                        bw.append("\n"+trim);
                        bw.append("\t"+loc);
                    }
                }
            num++;
            }
            
            
            fstream.close();
            //Close the input stream
        } 
        bw.close();
        fileWriter.close();
      }
    
}
