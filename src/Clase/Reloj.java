/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Clase;

import java.util.*;
import javax.swing.JLabel;
import javax.swing.JTextField;
import analizador.de.cadenas.AnalizadorCadena;
import javax.swing.JOptionPane;


/**
 *
 * @author Sammy Guergachi <sguergachi at gmail.com>
 */
public class Reloj implements Runnable {

    String hora, minuto, segundo, AmPm, year,month,day;
    JLabel labelReloj, labelFecha;
    Fichero fichero;
    Exportar exportar;
    Calendar calendario;
    public Thread hilo1;

    public Reloj(JLabel labelReloj,JLabel labelFecha,Exportar exportar) {
        this.labelReloj = labelReloj;
        this.labelFecha = labelFecha;
        this.fichero = new Fichero();
        this.exportar = exportar;
        hilo1 = new Thread(this);
    }

    @Override
    public void run() {
      //  Thread ct = Thread.currentThread();
/*
        while (ct == hilo1) {
            calcula();
            labelReloj.setText(hora + ":" + minuto + ":" + segundo + " " + AmPm);
            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
        }
        */
       while(true){
            calcula();
            labelReloj.setText(hora + ":" + minuto + ":" + segundo + " " + AmPm);
            labelFecha.setText(day+" / "+month+" / "+year);
            fichero = new Fichero();
           
            if(fichero.getHoraEjecucion().length()!=0 && fichero.getRutaExportar().length()!=0){
                if(labelReloj.getText().equals(fichero.getHoraEjecucion())){
                 exportar.setRuta(fichero.getRutaExportar());
                 exportar.ExportarBase();
            } 
            }
            try {
                Thread.sleep(1000);
            } catch (Exception e) {
            }
           
       }
    }

    

    private void calcula() {
        Calendar calendario = new GregorianCalendar();
        Date fechaHoraActual = new Date();

        calendario.setTime(fechaHoraActual);
        AmPm = calendario.get(Calendar.AM_PM) == Calendar.AM ? "AM" : "PM";
        /*Hora*/
        if (AmPm.equals("PM")) {
            int h = calendario.get(Calendar.HOUR_OF_DAY) - 12;
            hora = h > 9 ? "" + h : "0" + h;
        } else {
            hora = calendario.get(Calendar.HOUR_OF_DAY) > 9 ? "" + calendario.get(Calendar.HOUR_OF_DAY) : "0" + calendario.get(Calendar.HOUR_OF_DAY);
        }
        minuto = calendario.get(Calendar.MINUTE) > 9 ? "" + calendario.get(Calendar.MINUTE) : "0" + calendario.get(Calendar.MINUTE);
        segundo = calendario.get(Calendar.SECOND) > 9 ? "" + calendario.get(Calendar.SECOND) : "0" + calendario.get(Calendar.SECOND);
        /*Fecha*/
        year  = calendario.get(Calendar.YEAR)+"";
        month = calendario.get(Calendar.MONTH)+"";
        day   = calendario.get(Calendar.DAY_OF_MONTH)+"";
     /*
     hora = fechaHoraActual.getHours()>9?""+fechaHoraActual.getHours():"0"+fechaHoraActual.getHours();
     minuto = fechaHoraActual.getMinutes()>9?""+fechaHoraActual.getMinutes():"0"+fechaHoraActual.getMinutes();
     segundo = fechaHoraActual.getSeconds()>9?""+fechaHoraActual.getSeconds():"0"+fechaHoraActual.getSeconds();
*/
    }

}
