/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Categories;
import com.tech.blog.entities.Posts;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rahul Singh
 */
public class CategoriesDao {

    Connection con;

    public CategoriesDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Categories> getAllCategories() {
        ArrayList<Categories> catList = new ArrayList<>();
        try {
            String query = "select * from categories";
            PreparedStatement pstmt = con.prepareStatement(query);
            ResultSet set = pstmt.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Categories cat = new Categories(cid, name, description);
                catList.add(cat);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return catList;
    }

    // get all the posts
    public List<Posts> getAllPosts() {
        List<Posts> postList = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts order by pid desc");
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int catId = set.getInt("catId");
                int userId = set.getInt("userId");
                Posts posts = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                postList.add(posts);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postList;
    }

    // get all the posts by catid
    public List<Posts> getPostByCatId(int catId) {
        List<Posts> postListByCatId = new ArrayList<>();
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts where catId=?");
            pstmt.setInt(1, catId);
            ResultSet set = pstmt.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                Posts posts = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
                postListByCatId.add(posts);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return postListByCatId;
    }

    public Posts getPostByPostId(int postId) {
        Posts posts = null;
        try {
            PreparedStatement pstmt = con.prepareStatement("select * from posts where pid=?");
            pstmt.setInt(1, postId);
            ResultSet set = pstmt.executeQuery();
            if (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp date = set.getTimestamp("pDate");
                int userId = set.getInt("userId");
                int catId = set.getInt("catId");
                posts = new Posts(pid, pTitle, pContent, pCode, pPic, date, catId, userId);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return posts;
    }

    public boolean savePost(Posts posts) {
        boolean flag = false;
        try {
            String query = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId) values(?,?,?,?,?,?)";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, posts.getpTitle());
            pstmt.setString(2, posts.getpContent());
            pstmt.setString(3, posts.getpCode());
            pstmt.setString(4, posts.getpPic());
            pstmt.setInt(5, posts.getCatId());
            pstmt.setInt(6, posts.getUserId());
            pstmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}
