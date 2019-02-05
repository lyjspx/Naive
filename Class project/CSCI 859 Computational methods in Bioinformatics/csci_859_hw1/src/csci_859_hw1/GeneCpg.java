package csci_859_hw1;
/**
 *This class define an object with 3 attributes to store a gene's cpg information
 * @author Yuan Liu
 */
public class GeneCpg {
       private String name;
       private int startIndex;
       private int endIndex;
        
       public GeneCpg(String n, int s, int e){
           name = n;
           startIndex = s;
           endIndex = e;
       }
       
       //reutrn the gene's name
       public String getName(){return name;}
       
       //return the cpg island's start index of the gene
       public int getStart() {return startIndex;}
       
       //return the cpg island's end index of the gene
       public int getEnd() {return endIndex;}
}
