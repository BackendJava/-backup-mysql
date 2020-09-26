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
public class Producto {

    public String getConsulta(int indexForma, int indexOrden, String parametro) {
        String consulta = "select * from producto";
        int id;
        if (!"".equals(parametro)) {//Si tiene parametros
            switch (indexForma) {
                case 0:// si es por id
                    try {
                    id = Integer.parseInt(parametro);
                    consulta = consulta + " where id = " + parametro;
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Ingrese solo digitos", "Error", JOptionPane.ERROR_MESSAGE);
                    consulta = consulta + " where id = " + -1;
                }
                break;
                case 1:// si es por nombre
                    consulta = consulta + " where Nombre = '" + parametro + "'";
                    break;
            }
        }
        switch (indexOrden) {
            //de mayor existencia a menor existencia
            case 1:
                consulta += " order by Existencias desc";
                break;
            //de mayor precio a menor precio  
            case 2:
                consulta += " order by Precio desc";
                break;
            //de menor existencia a mayor existencia
            case 3:
                consulta += " order by Existencias";
                break;
            //de menor precio a mayor precio
            case 4:
                consulta += " order by Precio";
                break;

        }

        return consulta;
    }

}
