/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Clase;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import javax.swing.JOptionPane;

/**
 * 
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Exportar {
        private String ruta, nombreRespaldo, comando, usuario,contra,baseDatos;
        
    public Exportar(String contra,String usuario,String baseDatos) {
        this.usuario = usuario;
        this.contra = contra;
        this.baseDatos = baseDatos;
        this.nombreRespaldo = "\\baseRespaldo.sql";
    }
    public void ExportarBase(){
        if(ruta.length()!=0){
            System.out.println("if");
            try {
                System.out.println("try");
            Process proceso = Runtime.getRuntime().exec("mysqldump -u "+usuario+" -p"+contra+" "+baseDatos);
                System.out.println(":C");
            new HiloLector(proceso.getErrorStream()).start();
            InputStream is = proceso.getInputStream();
            FileOutputStream fos = new FileOutputStream(ruta+nombreRespaldo);
                System.out.println(":v");
            byte[] buffer = new byte[1000];
            int leido = is.read(buffer);
            while (leido > 0) {
                fos.write(buffer, 0, leido);
                leido = is.read(buffer);
            }
            fos.close();
         JOptionPane.showMessageDialog(null,"Se exporto el archivo","Mensaje",JOptionPane.INFORMATION_MESSAGE);
        } catch (IOException e) {
            //Logger.getLogger(PruebaEjecutarComando.class.getName()).log(Level.SEVERE,null,e);
           JOptionPane.showMessageDialog(null,"Error al exportar","Error",JOptionPane.ERROR_MESSAGE);
        }
           
        }
    }
    public void setRuta(String ruta) {
        this.ruta = ruta;
    }
   
    
}
