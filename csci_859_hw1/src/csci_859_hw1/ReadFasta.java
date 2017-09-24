package csci_859_hw1;
/*
 * This class is designed to read a fasta file. Two array will be generated, one filled with name of genes,
 * the other one filled with sequence of genes. Index of these two array are corresponding. 
 *
 */
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


public final class ReadFasta {

    private String [] description;
    private String [] sequence;
    private int size;
    
    public ReadFasta(String filename)
    {
       	readSequenceFromFile(filename);
    }

    void readSequenceFromFile(String file)
    {
	List desc= new ArrayList();
	List seq = new ArrayList();
	try{
        BufferedReader in     = new BufferedReader( new FileReader( file ) );
        StringBuffer   buffer = new StringBuffer();
        String         line   = in.readLine();
     
        if( line == null )
            throw new IOException( file + " is an empty file" );
     
        if( line.charAt( 0 ) != '>' )
            throw new IOException( "First line of " + file + " should start with '>'" );
        else
            desc.add(line);
        for( line = in.readLine().trim(); line != null; line = in.readLine() )
	{
            if( line.length()>0 && line.charAt( 0 ) == '>' )
	    {
		seq.add(buffer.toString());
		buffer = new StringBuffer();
		desc.add(line);
	    } else  
            	buffer.append( line.trim() );
        }   
        if( buffer.length() != 0 )
	     seq.add(buffer.toString());
      }catch(IOException e)
      {
        System.out.println("Error when reading "+file);
      }

	description = new String[desc.size()];
	sequence = new String[seq.size()];
	for (int i=0; i< seq.size(); i++)
	{
	  description[i]=(String) desc.get(i);
          description[i] = description[i].substring(1);
	  sequence[i]=(String) seq.get(i);
          sequence[i] = sequence[i].toLowerCase();
	}
        
        size = desc.size();
    }
    
    //return first sequence as a String
    public String getSequence(){ return sequence[0];}

    //return first xdescription as String
    public String getDescription(){return description[0];}

    //return sequence as a String
    public String getSequence(int i){ return sequence[i];}

    //return description as String
    public String getDescription(int i){return description[i];}
    
    //return the number of genes
    public int getSize(){return size;}
    
    //return the array of sequence
    public String[] getSequenceArray() {return sequence;}
    
    //return the array of description(name of genes)
    public String[] getNameArray() {return description;}
    
}
