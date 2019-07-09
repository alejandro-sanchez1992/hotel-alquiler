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
import com.mongodb.DBCursor;
import com.mongodb.MongoClient;
import java.util.LinkedList;

/**
 *
 * @author Usuario
 */
public class Consultar {
    
    public static LinkedList<Alquiler> ConsultarDatos(int cedula) {
        
        Conexion cnx = new Conexion();
        Alquiler alqui = new Alquiler();
        LinkedList<Alquiler> list = new LinkedList<Alquiler>();
        
        MongoClient mongo = cnx.CrearConexion();
        
        if (mongo != null) { 
            //Si no existe la base de datos la crea
            DB db = mongo.getDB("Hotel");

            //Crea una tabla si no existe y agrega datos
            DBCollection table = db.getCollection("alquiler");

            //Creando el filtro en el campo "nombre"
            BasicDBObject query = new BasicDBObject();
            query.put("cedula", cedula);

            //Busca y muestra todos los datos de la tabla donde "Cedula" sea la indicada
            DBCursor datos = table.find(query);
            while (datos.hasNext()) {
                alqui.setCedula((int)datos.next().get("cedula"));
                alqui.setNombre((String)datos.curr().get("nombre"));
                alqui.setTipoHabitacion((String)datos.curr().get("tipo_habitacion"));
                alqui.setDiasReserva((int)datos.curr().get("dias_reserva"));
                alqui.setTipoPago((String)datos.curr().get("tipo_pago"));
                alqui.setTotal((double)datos.curr().get("total"));
                list.add(alqui);
            }
        }
        else {
            alqui.setError("Error: Conexión no establecida");
        }
        return list;
    }
}
