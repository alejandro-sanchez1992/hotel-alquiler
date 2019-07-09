/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entidades;

import Daos.Consultar;
import Daos.Insertar;
import Utilidades.Conexion;

/**
 *
 * @author Usuario
 */
public class Alquiler {

    private int cedula;
    private String nombre;
    private String tipoHabitacion;
    private double valorHabitacion;
    private int diasReserva;
    private String tipoPago;
    private double total;
    private String Error;

    public Alquiler() {
        this.cedula = cedula;
        this.nombre = nombre;
        this.tipoHabitacion = tipoHabitacion;
        this.diasReserva = diasReserva;
        this.tipoPago = tipoPago;
        this.total = total;
    }
    
    

    public int getCedula() {
        return cedula;
    }

    public void setCedula(int cedula) {
        this.cedula = cedula;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoHabitacion() {
        return tipoHabitacion;
    }

    public void setTipoHabitacion(String tipoHabitacion) {
        this.tipoHabitacion = tipoHabitacion;
    }
    
    public double getValorHabitacion() {
        return valorHabitacion;
    }

    public void setValorHabitacion(double valorHabitacion) {
        this.valorHabitacion = valorHabitacion;
    }
    
    public int getDiasReserva() {
        return diasReserva;
    }

    public void setDiasReserva(int diasReserva) {
        this.diasReserva = diasReserva;
    }

    public String getTipoPago() {
        return tipoPago;
    }

    public void setTipoPago(String tipoPago) {
        this.tipoPago = tipoPago;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getError() {
        return Error;
    }

    public void setError(String Error) {
        this.Error = Error;
    }
    
    private boolean Validar() {
        if( this.diasReserva < 0 ) {
            this.Error = "Los días de reserva deben ser mayores a 0 por favor verifique su información";
            return false;
        }
        return true;
    }
    
    public boolean Insertar(){
        Insertar daos = new Insertar();
        Conexion con = new Conexion();
        
        daos.InsertarDatos(this.cedula, this.nombre, this.tipoHabitacion, this.diasReserva, this.tipoPago, this.total);
        con.CerrarConexion();
        
        return true;
    }
    
    public boolean Consultar() {
        Consultar consul = new Consultar();
        Conexion con = new Conexion();
        
        if(this.cedula != 0 && this.cedula > 0) {
            consul.ConsultarDatos(this.cedula);
            con.CerrarConexion();
        }
        return true;
    }
    
    public boolean CalcularPago() {
        double _total = 0;
        if (!this.Validar()) {
            return false;
        }
        
        switch(this.tipoHabitacion) {
            case "Sencilla":
                this.valorHabitacion = 35000;
                _total = this.diasReserva * this.valorHabitacion;
                break;
            case "Doble":
                this.valorHabitacion = 43000;
                _total = this.diasReserva * this.valorHabitacion;
                break;
        }
        
        this.setTotal(_total);
        return true;
    } 
}
