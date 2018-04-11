/*
 * Copyright (C) 2018 Rots87
 * This program is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, version 3.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 * See the GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along with this program.
 * If not, see <https://www.gnu.org/licenses/>.
 */

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
import java.util.Random;

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
    
    public String GenCodImp(){
        Random rand = new Random();
        String pass=null;
        pass=String.valueOf(rand.nextInt(100000));
        while(pass.length()<5){
         pass="0"+pass;   
        }
        return pass;
    }
    
    public String GenPass(){
        String SALTCHARS = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
        StringBuilder salt = new StringBuilder();
        Random rnd = new Random();
        while (salt.length() < 8) { // length of the random string.
            int index = (int) (rnd.nextFloat() * SALTCHARS.length());
            salt.append(SALTCHARS.charAt(index));
        }
        String saltStr = salt.toString();
        return saltStr;
    }
    
    
}
