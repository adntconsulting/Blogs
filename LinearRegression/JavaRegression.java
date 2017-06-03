/*****************************************************************
 *  Author: Ed Ekpoudom 
 *  Last Updated: 18 January 2017
 *
 *****************************************************************/
 
package adnt.java;

import org.apache.commons.math3.linear.QRDecomposition;
import org.apache.commons.math3.linear.RealMatrix;

public class JavaRegression {
    
    private final RealMatrix beta;  
   
    public JavaRegression (RealMatrix exog, RealMatrix endog) {
        
        QRDecomposition qr = new QRDecomposition(exog);
        
        beta = qr.getSolver().solve(endog);
    }

    public double getBeta(int p) {
        return beta.getEntry(p, 0);
    }

    public static void main(String[] args) {
        
        String filePath = "boston2.csv";
            
        RealMatrix dataMatrix = DataWrangler.csv2Matrix(filePath);
        
        RealMatrix exog = dataMatrix.getSubMatrix(0, 505, 0, 13);
        
        RealMatrix endog = dataMatrix.getColumnMatrix(14);
                
        JavaRegression fit = new JavaRegression(exog, endog);

        System.out.format("Coefficients: \n\nIntcpt \t= %.4f "
                + "\ncrim \t= %.4f \nzn \t= %.4f \n"
                + "indus \t= %.4f \nchas \t= %.4f \nnox \t= %.4f \n"
                + "rm \t= %.4f \nage \t=  %.4f \ndis \t= %.4f \n"
                + "rad \t= %.4f \ntax \t= %.4f \nptrtio \t= %.4f \n"
                + "black \t= %.4f \nlstat \t= %.4f\n",
                fit.getBeta(0), fit.getBeta(1),
                fit.getBeta(2), fit.getBeta(3),
                fit.getBeta(4), fit.getBeta(5),
                fit.getBeta(6), fit.getBeta(7),
                fit.getBeta(8), fit.getBeta(9),
                fit.getBeta(10), fit.getBeta(11),
                fit.getBeta(12), fit.getBeta(13));
    }
}   
