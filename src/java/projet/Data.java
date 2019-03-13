/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package projet;

/**
 *
 * @author skerautr
 */
public class Data {
    private boolean[][] carre;
    private int i,j;
    
    public Data(boolean[][] pcarre, int pi, int pj){
       carre = pcarre;
       i= pi;
       j = pj;
    }
    
    public boolean[][] getCarre(){
        return carre;
    }
    
    public int getI(){
        return i;
    }
    
    public int getJ(){
        return j;
    }
    
    public void setI(int pi){
        i = pi;
    }
    
    public void setJ(int pj){
        j = pj;
    }
    
    public void setCarre(boolean[][] pcarre){
        carre = pcarre;
    }
}
