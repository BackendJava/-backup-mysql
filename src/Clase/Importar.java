/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clase;

import javax.swing.JOptionPane;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Importar {
    private String ruta, comando, usuario,contra,baseDeDatos;
        
    public Importar(String contra,String usuario) {
        this.usuario = usuario;
        this.contra = contra;
        
    }
    public void ImportarBase(){
        if(ruta.length()!=0){
            try {
                comando = "cmd /c mysql -u "+usuario+" -p"+contra+" "+baseDeDatos+" < "+ruta;
                System.out.println(comando);
                Runtime rt = Runtime.getRuntime();
                rt.exec(comando);
                JOptionPane.showMessageDialog(null,"Se importo la base de datos","Mensaje",JOptionPane.INFORMATION_MESSAGE);
            } catch (Exception e) {
                JOptionPane.showMessageDialog(null,"Error al importar","Error",JOptionPane.ERROR_MESSAGE);
            }
            
        }
    }
    public void setRuta(String ruta) {
        this.ruta = ruta;
    }
    public void setBaseDatos(String baseDeDatos){
        this.baseDeDatos = baseDeDatos;
    }
  
}
