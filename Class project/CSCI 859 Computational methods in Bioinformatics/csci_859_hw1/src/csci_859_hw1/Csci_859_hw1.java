package csci_859_hw1;
import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.ListIterator;
import java.util.Scanner;
/**
 *This the client class of homework 1
 * @author Yuan Liu
 */
public class Csci_859_hw1 {   
    public static void main(String[] args) throws Exception {
        System.out.println("CSCI 859 Homework 1:");
        System.out.println("--------The program begins------");
        //read gene sequence from fasta data
        System.out.println("Loading sequence information......");
        String fn = "data_hum_mus.seq";
        ReadFasta fsf= new ReadFasta(fn);
        String geneName[] = fsf.getNameArray();
        String geneSeq[] = fsf.getSequenceArray();        
       // read cpg information text file
        System.out.println("loading cpg information......");
        fn = "data_hum_start.txt"; 
        LinkedList<GeneCpg> cpgInfo = ReadGeneInformation(fn);
        
        
        //The code below will print all the human genes
//        ListIterator<GeneCpg> human = cpgInfo.listIterator();
//         while(human.hasNext()){
//            GeneCpg temp = human.next();
//            int i = 0;
//            while((!temp.getName().equals(geneName[i]))){
//                i++;
//            }
//            System.out.println(i);
//         }
        
        //create a 2-d boolean array to store cpg island information
        //each cpgOfGene[i] corresponding to geneSeq[i], false respresent non-cpg island
        //true represent to cpg-island
        //In the seq data, the first 449 genes are human genes
        //The rest are mouses' genes (no cpg information) 
        boolean cpgOfGene[][] = new boolean[449][500000]; 
        ListIterator<GeneCpg> iter = cpgInfo.listIterator();
        while(iter.hasNext()){
            GeneCpg temp = iter.next();
            int i = 0;
            while((!temp.getName().equals(geneName[i])) && (i<449)){
                i++;
            }          
          
         //the below could verify all the seq should be marked with cpg info in cpgInfo                   
            int numOfCpg = temp.getEnd()-temp.getStart()+1;
            for(int j = temp.getStart(); j < temp.getEnd();j++){
                cpgOfGene[i][j]=true;
            }        
        }
          int count =0;
          for(int a =0; a < 449; a++ ){
            for(int b = 0; b < 500000;b++){
             if(cpgOfGene[a][b]==true) count++;
             }
          }
        //until now, I have a 2-d int array to indicate the cpg information of seq
       ArrayList<Boolean> exampleInfo = new ArrayList<>();
       ArrayList<String> exampleSeq = new ArrayList<>();
       for(int i = 0; i < 449; i++) {
           int j = 0, k = 0;
           while(k < geneSeq[i].length()-1){
               if(cpgOfGene[i][k]==cpgOfGene[i][k+1]) k++;
               else{
                   String temp = geneSeq[i].substring(j, k);
                   exampleSeq.add(temp);
                   exampleInfo.add(cpgOfGene[i][k]);
                   j = k + 1;
                   k++;
               }
           }
       }
       
       //examples have been transferred into a arraylist, exampleInfo. 
        for(int i = 0; i < exampleInfo.size(); i++){
             String temp = exampleSeq.get(i);
             if(temp.contains("n")) {
                 exampleInfo.remove(i);
                 exampleSeq.remove(i);
             }    
         }
        System.out.println("Total number of examples: "+exampleInfo.size());      
        int trainingDataEnd = 4*exampleSeq.size()/5;
         //indentifier ends with c means it from cpg island
        //transition probabilities will be counted and printed
        int aac =0, atc =0, acc=0, agc=0, tac=0, ttc=0, tcc=0, tgc=0, cac=0, ctc=0, ccc=0, cgc=0, gac=0, gtc=0, gcc=0, ggc=0;
        for(int i = 0;i < trainingDataEnd; i++){
            String temp = exampleSeq.get(i);
            for(int j =0; j < temp.length()-1; j++ ){
                if((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==true) aac++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==true) atc++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==true) agc++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==true) acc++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==true) tac++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==true) ttc++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==true) tgc++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==true) tcc++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==true) gac++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==true) gtc++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==true) ggc++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==true) gcc++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==true) cac++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==true) ctc++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==true) cgc++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==true) ccc++;
            }
        }
        double totalCpgTran = aac + atc + acc+ agc+ tac+ ttc+ tcc+ tgc+ cac+ ctc+ ccc+ cgc+ gac+ gtc+ gcc+ ggc;
        double accRatio = acc/totalCpgTran;
        double atcRatio = atc/totalCpgTran;
        double aacRatio = aac/totalCpgTran;
        double agcRatio = agc/totalCpgTran;
        double tacRatio = tac/totalCpgTran;
        double ttcRatio = ttc/totalCpgTran;
        double tccRatio = tcc/totalCpgTran;
        double tgcRatio = tgc/totalCpgTran;
        double cacRatio = cac/totalCpgTran;
        double ctcRatio = ctc/totalCpgTran;
        double cccRatio = ccc/totalCpgTran;
        double cgcRatio = cgc/totalCpgTran;
        double gacRatio = gac/totalCpgTran;
        double gtcRatio = gtc/totalCpgTran;
        double gccRatio = gcc/totalCpgTran;
        double ggcRatio = ggc/totalCpgTran;
        
        System.out.println("Transition table of CpG island ");
        System.out.println("In CpG island, A -> A : "+ aacRatio);
        System.out.println("In CpG island, A -> T : "+ atcRatio);
        System.out.println("In CpG island, A -> G : "+ agcRatio);
        System.out.println("In CpG island, A -> C : "+ accRatio);
        System.out.println("In CpG island, T -> A : "+ tacRatio);
        System.out.println("In CpG island, T -> T : "+ ttcRatio);
        System.out.println("In CpG island, T -> G : "+ tgcRatio);
        System.out.println("In CpG island, T -> C : "+ tccRatio);
        System.out.println("In CpG island, G -> A : "+ gacRatio);
        System.out.println("In CpG island, G -> T : "+ gtcRatio);
        System.out.println("In CpG island, G -> G : "+ ggcRatio);
        System.out.println("In CpG island, G -> C : "+ gccRatio);
        System.out.println("In CpG island, C -> A : "+ cacRatio);
        System.out.println("In CpG island, C -> T : "+ ctcRatio);
        System.out.println("In CpG island, C -> G : "+ cgcRatio);
        System.out.println("In CpG island, C -> C : "+ cccRatio);
        
        int aan =0, atn =0, acn=0, agn=0, tan=0, ttn=0, tcn=0, tgn=0, can=0, ctn=0, ccn=0, cgn=0, gan=0, gtn=0, gcn=0, ggn=0;
        for(int i = 0;i < trainingDataEnd; i++){
            String temp = exampleSeq.get(i);
            for(int j =0; j < temp.length()-1; j++ ){
                if((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==false) aan++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==false) atn++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==false) agn++;
                else if ((temp.charAt(j)=='a')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==false) acn++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==false) tan++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==false) ttn++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==false) tgn++;
                else if ((temp.charAt(j)=='t')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==false) tcn++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==false) gan++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==false) gtn++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==false) ggn++;
                else if ((temp.charAt(j)=='g')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==false) gcn++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='a')&&exampleInfo.get(i)==false) can++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='t')&&exampleInfo.get(i)==false) ctn++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='g')&&exampleInfo.get(i)==false) cgn++;
                else if ((temp.charAt(j)=='c')&&(temp.charAt(j+1)=='c')&&exampleInfo.get(i)==false) ccn++;
            }
        }
        double totalNCpgTran = aan + atn + acn+ agn+ tan+ ttn+ tcn+ tgn+ can+ ctn+ ccn+ cgn+ gan+ gtn+ gcn+ ggn;
        double acnRatio = acn/totalNCpgTran;
        double atnRatio = atn/totalNCpgTran;
        double aanRatio = aan/totalNCpgTran;
        double agnRatio = agn/totalNCpgTran;
        double tanRatio = tan/totalNCpgTran;
        double ttnRatio = ttn/totalNCpgTran;
        double tcnRatio = tcn/totalNCpgTran;
        double tgnRatio = tgn/totalNCpgTran;
        double canRatio = can/totalNCpgTran;
        double ctnRatio = ctn/totalNCpgTran;
        double ccnRatio = ccn/totalNCpgTran;
        double cgnRatio = cgn/totalNCpgTran;
        double ganRatio = gan/totalNCpgTran;
        double gtnRatio = gtn/totalNCpgTran;
        double gcnRatio = gcn/totalNCpgTran;
        double ggnRatio = ggn/totalNCpgTran;
        
        System.out.println("\nTransition table of Non-CpG island ");
        System.out.println("In NonCpG island, A -> A : "+ aanRatio);
        System.out.println("In NonCpG island, A -> T : "+ atnRatio);
        System.out.println("In NonCpG island, A -> G : "+ agnRatio);
        System.out.println("In NonCpG island, A -> C : "+ acnRatio);
        System.out.println("In NonCpG island, T -> A : "+ tanRatio);
        System.out.println("In NonCpG island, T -> T : "+ ttnRatio);
        System.out.println("In NonCpG island, T -> G : "+ tgnRatio);
        System.out.println("In NonCpG island, T -> C : "+ tcnRatio);
        System.out.println("In NonCpG island, G -> A : "+ ganRatio);
        System.out.println("In NonCpG island, G -> T : "+ gtnRatio);
        System.out.println("In NonCpG island, G -> G : "+ ggnRatio);
        System.out.println("In NonCpG island, G -> C : "+ gcnRatio);
        System.out.println("In NonCpG island, C -> A : "+ canRatio);
        System.out.println("In NonCpG island, C -> T : "+ ctnRatio);
        System.out.println("In NonCpG island, C -> G : "+ cgnRatio);
        System.out.println("In NonCpG island, C -> C : "+ ccnRatio);
        System.out.println("Totally, "+ (totalNCpgTran+totalCpgTran) + " base pairs in training dataset");
        
        CalculateP calculator = new CalculateP(aacRatio, atcRatio, agcRatio, accRatio, tacRatio, ttcRatio, tgcRatio, tccRatio, gacRatio, gtcRatio, ggcRatio, gccRatio, cacRatio, ctcRatio, cgcRatio, cccRatio,aanRatio, atnRatio, agnRatio, acnRatio, tanRatio, ttnRatio, tgnRatio, tcnRatio, ganRatio, gtnRatio, ggnRatio, gcnRatio, canRatio, ctnRatio, cgnRatio, ccnRatio);
        ArrayList<Boolean> testInfo = new ArrayList<>();
        for(int i = trainingDataEnd+1; i <exampleInfo.size();i++){
            boolean temp = calculator.Calculation(exampleSeq.get(i));
            testInfo.add(temp);
           // System.out.println(temp + " " + exampleInfo.get(i));
        }
        int TP = 0, TN = 0, FP = 0, FN = 0;
        for(int i = 0; i < testInfo.size(); i++){
            if(testInfo.get(i)==true && exampleInfo.get(trainingDataEnd+i+1)==true) TP++;
            else if(testInfo.get(i)==true && exampleInfo.get(trainingDataEnd+i+1)==false) FN++;
            else if(testInfo.get(i)==false && exampleInfo.get(trainingDataEnd+i+1)==true) FP++;
            else if(testInfo.get(i)==false && exampleInfo.get(trainingDataEnd+i+1)==false) TN++;
        }
        System.out.println("\nTP:"+ TP+" FN:"+ FN+" FP:"+ FP+" TN:"+ TN+" ");
        System.out.println("Final Accuracy of testing dataset: " + (double) (TP+TN)/(TP+TN+FP+FN) );
        System.out.println("\n-------The program is over--------");
    }
    // the cpg island information text file will be read by lines. Then line will be added into a LinkedList. 
    public static LinkedList<GeneCpg> ReadGeneInformation(String filePath) throws FileNotFoundException{
        LinkedList<GeneCpg> list = new LinkedList();
        File file = new File(filePath);
        Scanner scanFile = new Scanner(file);
        scanFile.nextLine();
        int i = 0;
        while(scanFile.hasNextLine()){
            String temp = scanFile.nextLine();
            Scanner scanTemp = new Scanner(temp);
            String name = scanTemp.next();
            int start = scanTemp.nextInt();
            int end = scanTemp.nextInt();
            GeneCpg singleLine = new GeneCpg(name,start,end);
            list.add(singleLine);
        }
        return list;
    }

}   
    

