/*A simple implementation of Burrows-Wheeler Transformation and inverse BWT.
 What is BWT? See https://en.wikipedia.org/wiki/Burrows%E2%80%93Wheeler_transform
 A common compression techique has been used in Bioinformatics, especially in read mapping. 
 Examples: Bowtie, BWA, etc. 
*/

import java.util.Arrays;
public class main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String test="helloworld";
		test=test.toLowerCase();
		test= "$"+test;
		System.out.println("This is transformed: "+BWT(test));
		System.out.println("This is original: "+InverseBWT(BWT(test)).substring(1));
		
	}
	public static String BWT(String inputString){
		int stringLength=inputString.length();
		String[] rotate= new String[stringLength];
		String transformedString="";
	    for(int i=0;i<stringLength;i++){
	    	rotate[i]=inputString;
	    	inputString=inputString.substring(1,stringLength)+inputString.charAt(0);
	    }
	    Arrays.sort(rotate);
	    for(int i=0;i<stringLength;i++){
	    	transformedString = transformedString+rotate[i].charAt(stringLength-1);
	    }
	    return(transformedString);
	}
	public static String InverseBWT(String inputString) {
		int stringLength=inputString.length();
		String originalString="";
		String[] rotate=new String[stringLength];
		
	    for(int i=0;i<stringLength;i++){
	    	rotate[i]="";
	    }
	    for(int i=0;i<stringLength;i++){
		    for(int j=0;j<stringLength;j++){
		    	rotate[j]=inputString.charAt(j)+rotate[j];
		    }
		    Arrays.sort(rotate);   
	    }
	    originalString=rotate[0];
		return originalString;
	}
}
