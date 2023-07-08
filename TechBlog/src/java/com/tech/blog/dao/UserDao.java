/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Rahul Singh
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    // method to insert user to db
    public boolean saveUser(User user) {
        boolean queryExecuted = false;
        try {

            String query = "insert into user(name,email,password,gender) values (?,?,?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());

            pstmt.executeUpdate();
            queryExecuted = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return queryExecuted;
    }

    // get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String query = "select * from user where email=? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();

                // data from db
                String name = set.getString("name");

                // set to user obj
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("regdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean queryExecuted = false;
        try {
            String query = "update user set name=?, email=?, password=?, gender=?, profile=? where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, user.getName());
            pstmt.setString(2, user.getEmail());
            pstmt.setString(3, user.getPassword());
            pstmt.setString(4, user.getGender());
            pstmt.setString(5, user.getProfile());
            pstmt.setInt(6, user.getId());
            pstmt.executeUpdate();
            queryExecuted = true;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return queryExecuted;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String query = "select * from user where id=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, userId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                user = new User();

                // data from db
                String name = set.getString("name");

                // set to user obj
                user.setName(name);
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("regdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

}
