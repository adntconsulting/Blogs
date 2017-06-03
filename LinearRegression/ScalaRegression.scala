/*****************************************************************
 *  Author: Ed Ekpoudom 
 *  Last Updated: 18 January 2017
 *
 *****************************************************************/
 
package adnt.scala 
 
import org.apache.commons.math3.linear._
import org.apache.commons.math3.linear.QRDecomposition._
import org.apache.commons.math3.linear.RealMatrix._
import Array._
import adnt.java.DataWrangler

class ScalaRegression(exog: RealMatrix, endog: RealMatrix){
            
  val qr = new QRDecomposition(exog)
  
  val beta = qr.getSolver().solve(endog)
              
  def getBeta(p: Int) = beta.getEntry(p, 0)
       
}
    
object ScalaRegression {

  def main(args: Array[String]): Unit = {
        
    val filePath = "boston2.csv"
            
    val dataMatrix = DataWrangler.csv2Matrix(filePath)
        
    val exog = dataMatrix.getSubMatrix(0, 505, 0, 13)
        
    val endog = dataMatrix.getColumnMatrix(14)
                
    val fit = new ScalaRegression(exog, endog)

    println("Coefficients: \n\nIntcpt \t= %.4f ".format(fit.getBeta(0)))
    println("crim \t= %.4f \nzn \t= %.4f".format(fit.getBeta(1), 
        fit.getBeta(2)))
    println("indus \t= %.4f \nchas \t= %.4f".format(fit.getBeta(3), 
        fit.getBeta(4)))
    println("nox \t= %.4f \nrm \t= %.4f".format(fit.getBeta(5), 
        fit.getBeta(6)))
    println("age \t=  %.4f \ndis \t= %.4f".format(fit.getBeta(7), 
        fit.getBeta(8)))
    println("rad \t= %.4f \ntax \t= %.4f".format(fit.getBeta(9), 
        fit.getBeta(10)))
    println("ptrtio \t= %.4f \nblack \t= %.4f".format(fit.getBeta(11), 
        fit.getBeta(12)))
    println("lstat \t= %.4f".format(fit.getBeta(13)))
    }
}
