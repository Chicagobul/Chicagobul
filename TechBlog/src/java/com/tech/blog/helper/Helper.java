/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

/**
 *
 * @author Rahul Singh
 */
public class Helper {

    public static boolean deleteFile(String path) {
        boolean delFile = false;
        try {
            File file = new File(path);
            delFile = file.delete();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return delFile;
    }
    
    public static boolean saveFile(InputStream inputStream, String path){
        boolean saveFile = false;
        try {
            byte byteData[] = new byte[inputStream.available()];
            inputStream.read(byteData);
            FileOutputStream fileOutputStream = new FileOutputStream(path);
            fileOutputStream.write(byteData);
            fileOutputStream.flush();
            fileOutputStream.close();
            saveFile = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return saveFile;
    }
}
