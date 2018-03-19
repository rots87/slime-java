/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlers;

import Views.Login;
import Views.Main;
import Models.MUser;
import javax.swing.JOptionPane;

/**
 *
 * @author rots
 * @since 2018
 * @version 0.1
 * 
 */
public class User {
    protected String name;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    /**
     * @param name
     * @param password
     * @param login
     * 
     * 
     * 
     */
    public void LogIn(String name, String password, Login login) {
        MUser user = new MUser();
        if(user.LogIn(name, password)){
            Main principal = new Main();
            login.dispose();
            principal.setVisible(true);
        }else{
            JOptionPane.showMessageDialog(null, "Error de contraseña, intenta de nuevo");
        }
    }
    
    
}
