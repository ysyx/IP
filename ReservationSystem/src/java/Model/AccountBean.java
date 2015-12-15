/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;
import Database.DB;
/**
 *
 * @author JJ
 */
public class AccountBean {
    private String pk_id = null;
    private String name = null;
    private String matric_no = null;
    private String password = null;
    private String no_tel = null;
    private String email = null;
    private String type = null;
    
    public String getPk_id() {
        return pk_id;
    }

    public void setPk_id(String pk_id) {
        this.pk_id = pk_id;
    }
    
    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getMatric_no() {
        return matric_no;
    }

    public void setMatric_no(String matric_no) {
        this.matric_no = matric_no;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getNo_tel() {
        return no_tel;
    }

    public void setNo_tel(String no_tel) {
        this.no_tel = no_tel;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public boolean verify_login(){
        
        DB db= new DB();
        if(db.connect()){
            db.query("select * from user where email='"+email+"' and password='"+password+"' ");
            matric_no = db.getDataAt( 0,"matric_no");
            if(matric_no != null){
                type = db.getDataAt(0,"type");
                name = db.getDataAt(0,"name");
                no_tel = db.getDataAt(0,"no_tel");
                pk_id = db.getDataAt(0,"pk_id");
                
                db.close();
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    
    
}
