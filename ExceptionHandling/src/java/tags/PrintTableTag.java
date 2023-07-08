/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tags;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

/**
 *
 * @author Rahul Singh
 */
public class PrintTableTag extends TagSupport {

    public int number;
    public String color;

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }
    

    @Override
    public int doStartTag() throws JspException {
        try {
            JspWriter out = pageContext.getOut();
            out.println("<div style='color : "+color+" '>");
            out.print("<br>");
            for (int i = 1; i <= 10; i++) {
                out.println((number * i) + "<br>");
            }
            out.println("</div>");
        } catch (IOException ex) {
            Logger.getLogger(PrintTableTag.class.getName()).log(Level.SEVERE, null, ex);
        }
        return SKIP_BODY;
    }

}
