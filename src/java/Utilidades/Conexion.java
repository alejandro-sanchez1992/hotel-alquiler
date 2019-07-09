/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utilidades;

import com.mongodb.*; 
import java.util.List;


/**
 *
 * @author Usuario
 */
public class Conexion {
    
    private String usuario;
    private String pass;
    private String host;
    private String baseDatos;
    
    public Conexion(){
        usuario = "admin";
        pass = "admin";
        host = "127.0.0.1";
        baseDatos = "Hotel";
    }
    
    public void AbrirConexion() {
        
        MongoClient mongo = CrearConexion();
 
        if (mongo != null) {
            System.out.println("Lista de bases de datos: ");
            printDatabases(mongo);
 
        } else {
            System.out.println("Error: Conexión no establecida");
        }
    }
    
    public MongoClient CrearConexion() {
        
        MongoClient mongo = null;
        try {
            mongo = new MongoClient("localhost", 27017);
        } catch (Exception e) {
            e.printStackTrace();
        }
 
        return mongo;
    }
    
    private static void printDatabases(MongoClient mongo) {
        List dbs = mongo.getDatabaseNames();
        for (Object db : dbs) {
            System.out.println(" - " + db);
        }
    }
    
    public void CerrarConexion() {
        MongoClient mongo = this.CrearConexion();
        mongo.close();
    }
}
