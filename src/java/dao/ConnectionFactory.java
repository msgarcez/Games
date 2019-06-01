/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author mathe
 */
public class ConnectionFactory {
    public static Connection getConnection(){
        try{
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection("jdbc:postgresql://localhost:5432/Center_Games", "postgres", "mat20071996");
        }
        catch(Exception e){
            System.out.print("Erro:" + e.getMessage());
            return null;
        }
    }
}
