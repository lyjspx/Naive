/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tagcompare_12_27;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author Yuan Liu
 */
public class TagCompare_12_27 {

    /**
     * @param args the command line arguments
     * @throws java.io.IOException
     */
    public static void main(String[] args) throws IOException {
        String tagInGenMap = "tags3T5_NAMintmap.sam";
        String statInfo = args[0];
        String outputFile = args[1];
        ArrayList<String> seqList = new ArrayList(); 
        ArrayList<String> locList = new ArrayList();
        FileInputStream fstream = new FileInputStream(tagInGenMap);
        try(BufferedReader br = new BufferedReader(new InputStreamReader(fstream))){
            String scanLine;
            int n = 0;
            while((scanLine = br.readLine()) != null){
                if(scanLine.charAt(0)=='@'){}
                else{
                    Scanner scan = new Scanner(scanLine).useDelimiter("\t");
                    String seq = scan.next();
                    String trim = seq;
                     trim = trim.substring(7);
                    seqList.add(trim);
                    scan.next();
                    locList.add(scan.next());
                    n++;
                }                  
           }
           fstream.close();
       }
        File file = new File(outputFile);
        FileWriter fileWriter = new FileWriter(file.getAbsolutePath());
        BufferedWriter bw = new BufferedWriter(fileWriter);
        FileInputStream fileStream = new FileInputStream(statInfo);
        
        try(BufferedReader br = new BufferedReader(new InputStreamReader(fileStream))){
            String scanLine;
            int n = 0;
            int count = 0;
            while((scanLine = br.readLine()) != null){
                //System.out.println(scanLine);
                //count++;
                //if(count % 100000 ==0) System.out.println(count);
                Scanner temp = new Scanner(scanLine).useDelimiter("\t");
                String seq = temp.next();
                //System.out.println(seq);
                int num =seqList.indexOf(seq);
                //System.out.println(num);
                if(num >= 0){
                    System.out.println(num);
                    bw.append(seq);
                    bw.append("\t" + locList.get(num));
                    while(temp.hasNext()){
                        bw.append("\t"+ temp.next());
                    }
                    seqList.remove(num);
                    locList.remove(num);
                    System.out.println(n + " have been processed");
                    n++;
                }
            }
            System.out.println("In seqListseq " + seqList.size() + "left" );
            br.close();
            fileWriter.close();
            fileStream.close();
        }
    }
    
}
