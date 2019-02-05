package csci_859_hw1;

/**
 *This class aims to calculate the probability of a String
 * @author desert
 */
public class CalculateP {
    
    double accRatio = 0;
    double atcRatio = 0;
    double aacRatio = 0;
    double agcRatio = 0;
    double tacRatio = 0;
    double ttcRatio = 0;
    double tccRatio = 0;
    double tgcRatio = 0;
    double cacRatio = 0;
    double ctcRatio = 0;
    double cccRatio = 0;
    double cgcRatio = 0;
    double gacRatio = 0;
    double gtcRatio = 0;
    double gccRatio = 0;
    double ggcRatio = 0;
    
    double acnRatio = 0;
    double atnRatio = 0;
    double aanRatio = 0;
    double agnRatio = 0;
    double tanRatio = 0;
    double ttnRatio = 0;
    double tcnRatio = 0;
    double tgnRatio = 0;
    double canRatio = 0;
    double ctnRatio = 0;
    double ccnRatio = 0;
    double cgnRatio = 0;
    double ganRatio = 0;
    double gtnRatio = 0;
    double gcnRatio = 0;
    double ggnRatio = 0;

    
    /**
     * 32 variables, cpg island then noncpg island
     * all the variable follows the sequence of 'atgc'
     * @param aac
     * @param atc
     * @param agc
     * @param acc
     * @param tac
     * @param ttc
     * @param tgc
     * @param tcc
     * @param gac
     * @param gtc
     * @param ggc
     * @param gcc
     * @param cac
     * @param ctc
     * @param cgc
     * @param ccc
     * @param aan
     * @param atn
     * @param agn
     * @param acn
     * @param tan
     * @param ttn
     * @param tgn
     * @param tcn
     * @param gan
     * @param gtn
     * @param ggn
     * @param gcn
     * @param can
     * @param ctn
     * @param cgn
     * @param ccn 
     */
    
    // transmit parameter into class
    public CalculateP(double aac,double atc, double agc, double acc, double tac,double ttc,double tgc, double tcc, double gac, double gtc, double ggc, double gcc, double cac, double ctc, double cgc, double ccc,double aan,double atn, double agn, double acn, double tan,double ttn,double tgn, double tcn, double gan, double gtn, double ggn, double gcn, double can, double ctn, double cgn, double ccn){      
         accRatio = acc;
         atcRatio = atc;
         aacRatio = aac;
         agcRatio = agc;
         tacRatio = tac;
         ttcRatio = ttc;
         tccRatio = tcc;
         tgcRatio = tgc;
         cacRatio = cac;
         ctcRatio = ctc;
         cccRatio = ccc;
         cgcRatio = cgc;
         gacRatio = gac;
         gtcRatio = gtc;
         gccRatio = gcc;
         ggcRatio = ggc;
        
          acnRatio = acn;
         atnRatio = atn;
         aanRatio = aan;
         agnRatio = agn;
         tanRatio = tan;
         ttnRatio = ttn;
         tcnRatio = tcn;
         tgnRatio = tgn;
         canRatio = can;
         ctnRatio = ctn;
         ccnRatio = ccn;
         cgnRatio = cgn;
         ganRatio = gan;
         gtnRatio = gtn;
         gcnRatio = gcn;
         ggnRatio = ggn;
    }
    
    //calculate the probability of a String, return a blooean value
    public boolean Calculation(String target){
        double pValue = 1;
        double logValue = 0;
        
        for(int i = 0; i < target.length()-1;i++){
            if(target.charAt(i)=='a' && target.charAt(i+1)=='a') logValue += Math.log( aacRatio/aanRatio);
            else if(target.charAt(i)=='a' && target.charAt(i+1)=='t') logValue += Math.log( atcRatio/atnRatio);
            else if(target.charAt(i)=='a' && target.charAt(i+1)=='g') logValue += Math.log( agcRatio/agnRatio);
            else if(target.charAt(i)=='a' && target.charAt(i+1)=='c') logValue += Math.log( accRatio/acnRatio);
            else if(target.charAt(i)=='t' && target.charAt(i+1)=='a') logValue += Math.log( tacRatio/tanRatio);
            else if(target.charAt(i)=='t' && target.charAt(i+1)=='t') logValue += Math.log( ttcRatio/ttnRatio);
            else if(target.charAt(i)=='t' && target.charAt(i+1)=='g') logValue += Math.log( tgcRatio/tgnRatio);
            else if(target.charAt(i)=='t' && target.charAt(i+1)=='c') logValue += Math.log( tccRatio/tcnRatio);
            else if(target.charAt(i)=='g' && target.charAt(i+1)=='a') logValue += Math.log( gacRatio/ganRatio);
            else if(target.charAt(i)=='g' && target.charAt(i+1)=='t') logValue += Math.log( gtcRatio/gtnRatio);
            else if(target.charAt(i)=='g' && target.charAt(i+1)=='g') logValue += Math.log( ggcRatio/ggnRatio);
            else if(target.charAt(i)=='g' && target.charAt(i+1)=='c') logValue += Math.log( gccRatio/gcnRatio);
            else if(target.charAt(i)=='c' && target.charAt(i+1)=='a') logValue += Math.log( cacRatio/canRatio);
            else if(target.charAt(i)=='c' && target.charAt(i+1)=='t') logValue += Math.log( ctcRatio/ctnRatio);
            else if(target.charAt(i)=='c' && target.charAt(i+1)=='g') logValue += Math.log( cgcRatio/cgnRatio);
            else if(target.charAt(i)=='c' && target.charAt(i+1)=='c') logValue += Math.log( cccRatio/ccnRatio);
         }
        return logValue>0;
        

    }
}
