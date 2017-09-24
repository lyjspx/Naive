/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package samplesequence;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.util.Scanner;

/**
 *
 * @author Yuan Liu
 */
public class SampleSequence {

    /**
     * @param args the command line arguments
     * @throws java.io.FileNotFoundException
     */
    public static void main(String[] args) throws FileNotFoundException {
        System.out.println("Enter file name: ");
        Scanner s = new Scanner(System.in);
        String fileName = s.nextLine();
        File file = new File(fileName);
        Scanner fileScan = new Scanner(file);
        try (PrintWriter writer = new PrintWriter("Sample_seq.fastq")) {
           for(int i = 0; i < 1000000; i++){
            writer.append(fileScan.nextLine());
           }
           writer.close();
        }
    }
    
}
