/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Daos;

import Entidades.Alquiler;
import Utilidades.Conexion;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.MongoClient;

/**
 *
 * @author Usuario
 */
public class Insertar {
    
    public void InsertarDatos(int cedula, String nombre, String tipoHabitacion, int dias, String tipoPago, double total) {
        
        Conexion cnx = new Conexion();
        Alquiler alqui = new Alquiler();
        
        MongoClient mongo = cnx.CrearConexion();
        
        if (mongo != null) {
            //Si no existe la base de datos la crea
            DB db = mongo.getDB("Hotel");

            //Crea una tabla si no existe y agrega datos
            DBCollection table = db.getCollection("alquiler");

            //Crea los objectos básicos
            BasicDBObject datos = new BasicDBObject();
            datos.put("cedula", cedula);
            datos.put("nombre", nombre);
            datos.put("tipo_habitacion", tipoHabitacion);
            datos.put("dias_reserva", dias);
            datos.put("tipo_pago", tipoPago);
            datos.put("total", total);
            
             //Insertar tablas
            table.insert(datos);
        }
        else {
            alqui.setError("Error: Conexión no establecida");
        }
    }
}
