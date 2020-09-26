/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JOptionPane;

/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Fichero {

    String rutaExportar, baseDatos, horaEjecucion, ficheroRuta, ficheroBase, ficheroHora;

    public Fichero() {
        this.ficheroRuta = "ruta.txt";
        this.ficheroBase = "baseDatos.txt";
        this.ficheroHora = "hora.txt";
        obtenerBaseDatos();
        obterRuta();
        obtenerHora();

    }

    public String getRutaExportar() {
        return rutaExportar;
    }

    public String getBaseDatos() {
        return baseDatos;
    }

    public String getHoraEjecucion() {
        return horaEjecucion;
    }

    /*Leer ficheros*/
    public void obterRuta() {
        String cadena = "";
        int caracter;
        try {
            FileReader fr = new FileReader("src\\Fichero\\" + ficheroRuta);
            caracter = fr.read();
            while (caracter != -1) {
                cadena += (char) caracter;
                caracter = fr.read();
            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.rutaExportar = cadena;

    }

    public void obtenerBaseDatos() {
        String cadena = "";
        int caracter = 0;
        try {
            FileReader fr = new FileReader("src\\Fichero\\" + ficheroBase);

            caracter = fr.read();

            while (caracter != -1) {
                cadena += (char) caracter;

                caracter = fr.read();

            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.baseDatos = cadena;

    }

    public void obtenerHora() {
        String cadena = "";
        int caracter = 0;
        try {
            FileReader fr = new FileReader("src\\Fichero\\" + ficheroHora);

            caracter = fr.read();

            while (caracter != -1) {
                cadena += (char) caracter;

                caracter = fr.read();

            }
        } catch (FileNotFoundException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }
        this.horaEjecucion = cadena;
    }

    /*Modificar ficheros*/
    public void setFicheroBase(String nuevoNombreBase) {
        try {
            //FileWriter fw = new FileWriter("D:\\test\\holamundo.txt"); //Rura obsoluta.
            FileWriter fw = new FileWriter("src\\Fichero\\" + ficheroBase);//ruta relativa, el true añade texto, si se le quita sobreescribe
            fw.write(nuevoNombreBase);
            fw.close();
            JOptionPane.showMessageDialog(null, "El nombre de la base de datos fue cammbiada", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setFicheroRuta(String nuevaRuta) {
        try {
            //FileWriter fw = new FileWriter("D:\\test\\holamundo.txt"); //Rura obsoluta.
            FileWriter fw = new FileWriter("src\\Fichero\\" + ficheroRuta);//ruta relativa, el true añade texto, si se le quita sobreescribe
            fw.write(nuevaRuta);
            fw.close();
            JOptionPane.showMessageDialog(null, "La ruta de exportacion fue modificada", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    public void setFicheroHora(String nuevaHora) {
        try {
            //FileWriter fw = new FileWriter("D:\\test\\holamundo.txt"); //Rura obsoluta.
            FileWriter fw = new FileWriter("src\\Fichero\\" + ficheroHora);//ruta relativa, el true añade texto, si se le quita sobreescribe
            fw.write(nuevaHora);
            fw.close();
            JOptionPane.showMessageDialog(null, "La hora de exportacion fue cambiada", "Mensaje", JOptionPane.INFORMATION_MESSAGE);
        } catch (IOException ex) {
            Logger.getLogger(Fichero.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
