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
public class Cliente {


    public String getConsulta(int indexTipo, int indexForma,String parametro){
        String consulta = "select * from cliente";
        boolean esTodos = false;
        int id;
        //Se evalua si se va a buscar por todos los cliente, por deudor o por sin deuda
        switch (indexTipo) {
            case 0:
                esTodos = true;
                break;
            case 1:
                consulta = consulta + " where Saldo > 0";
                break;
            case 2:
                consulta = consulta + " where Saldo = 0";
                break;
        }
        //Se verifica que se haya enviado algun parametro
        if (!"".equals(parametro)) {
            //Verificamos si es una busqueda de todos los clientes 
            if (esTodos) {
                consulta = consulta + " where "; //si son toddos
            } else {
                consulta = consulta + " and "; //si no son todos

            }
            //Se verifica en que formato se desea buscar id, nombre o nit
            switch (indexForma) {
                case 0: // si es por id 
           try {
                    id = Integer.parseInt(parametro);
                    consulta = consulta + "id = " + id;
                } catch (Exception e) {
                    JOptionPane.showMessageDialog(null, "Ingrese solo digitos", "Error", JOptionPane.ERROR_MESSAGE);
                    consulta = consulta + "id = " + -1;
                }
                break;
                case 1: // si es por nombre
                    consulta = consulta + "Nombre = '" + parametro + "'";
                    break;
                case 2:// si es por nit
                    consulta = consulta + "Nit = '" + parametro + "'";
                    break;
            }

        }
        return consulta;
    }

}
