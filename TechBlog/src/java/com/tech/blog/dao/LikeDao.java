/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Rahul Singh
 */
public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    public boolean insertLike(int pid, int uid){
        boolean like = false;
        try {
            String query = "insert into liked (pid,uid) values (?,?)";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            like = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return like;
    }
    
    public int countLikeOnPost(int pid){
        int count = 0;
        try {
           String query = "select count(*) from liked where pid=?";
            PreparedStatement pstmt = this.con.prepareStatement(query);
            pstmt.setInt(1, pid);
            ResultSet set = pstmt.executeQuery();
            if (set.next()){
                count = set.getInt("count(*)");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public boolean isLikedByUser(int pid, int uid){
        boolean flag = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("select * from liked where pid=? and uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            ResultSet set = pstmt.executeQuery();
            if (set.next()){
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
    public boolean deleteLike(int pid, int uid){
        boolean flag = false;
        try {
            PreparedStatement pstmt = this.con.prepareStatement("delete from liked where pid=? and uid=?");
            pstmt.setInt(1, pid);
            pstmt.setInt(2, uid);
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
    
}
