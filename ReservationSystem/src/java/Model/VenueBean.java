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
public class VenueBean {
    private String pk_id;
    private String venue_name;
    private String venue_description;
    private String venue_image;
    private String venue_size;
    private String venue_capacity;

    public String getPk_id() {
        return pk_id;
    }

    public void setPk_id(String pk_id) {
        this.pk_id = pk_id;
    }

    public String getVenue_name() {
        return venue_name;
    }

    public void setVenue_name(String venue_name) {
        this.venue_name = venue_name;
    }

    public String getVenue_description() {
        return venue_description;
    }

    public void setVenue_description(String venue_description) {
        this.venue_description = venue_description;
    }

    public String getVenue_image() {
        return venue_image;
    }

    public void setVenue_image(String venue_image) {
        this.venue_image = venue_image;
    }

    public String getVenue_size() {
        return venue_size;
    }

    public void setVenue_size(String venue_size) {
        this.venue_size = venue_size;
    }

    public String getVenue_capacity() {
        return venue_capacity;
    }

    public void setVenue_capacity(String venue_capacity) {
        this.venue_capacity = venue_capacity;
    }
    
    public boolean add_venue(){
        DB db = new DB();
        if(db.connect()){
            db.query("INSERT INTO VENUE (VENUE_NAME,VENUE_DESCRIPTION,VENUE_IMAGE,VENUE_SIZE,VENUE_CAPACITY) " +
                   "VALUES ( '"+venue_name+"','"+venue_description+"','Image','"+venue_size+"','"+venue_capacity+"')");
            db.close();
            DB database = new DB();
            if(database.connect()){
                database.query("select * from venue where (venue_name='"+venue_name+"' and venue_description='"+venue_description+"') ");
                pk_id = database.getDataAt(0,"pk_id");
                database.close();
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
    }
    
    public boolean delete_venue(){
        DB db = new DB();
        if(db.connect()){
            String sql = "DELETE from venue where pk_id='"+pk_id+"'";
            db.query(sql);
            db.close();
            
            return true;
        }else{
            return false;
        }
    }
    
    public boolean edit_venue(){
        DB db= new DB();
        if(db.connect()){
            db.query("SELECT * FROM venue WHERE pk_id='"+ pk_id+ "'");
            venue_name = db.getDataAt(0, "venue_name");
            venue_description = db.getDataAt(0, "venue_description");
            venue_image = db.getDataAt(0, "venue_image");
            venue_size = db.getDataAt(0, "venue_size");
            venue_capacity = db.getDataAt(0, "venue_capacity");
            db.close();
            return true;
        }else{
            return false;
        }
    }
    
    public boolean save_edited(){
        DB db= new DB();
        if(db.connect()){
            String sql2="UPDATE venue SET venue_name='"+venue_name+"', venue_description='"+venue_description+"', venue_size='"+venue_size+"', venue_capacity='"+venue_capacity+"' WHERE pk_id='"+pk_id+"'";
            String sql="UPDATE venue SET venue_name='"+venue_name+"', venue_description='"+venue_description+"', venue_image='"+venue_image+"', venue_size='"+venue_size+"', venue_capacity='"+venue_capacity+"' WHERE pk_id='"+pk_id+"'";
            db.query(sql);
            db.close();
            return true;
        }else{
            return false;
        }
    }
    public boolean save_edited2(){
        DB db= new DB();
        if(db.connect()){
            String sql="UPDATE venue SET  venue_image='"+venue_image+"' WHERE pk_id='"+pk_id+"'";
            db.query(sql);
            db.close();
            return true;
        }else{
            return false;
        }
    }
    public VenueBean merge(){
        VenueBean venuebean = new VenueBean();
        DB db= new DB();
            if(db.connect()){
                db.query("SELECT * FROM venue WHERE pk_id='"+pk_id+ "'");
                venue_name = db.getDataAt(0, "venue_name");
                venue_description = db.getDataAt(0, "venue_description");
                venue_image = db.getDataAt(0, "venue_image");
                venue_size = db.getDataAt(0, "venue_size");
                venue_capacity = db.getDataAt(0, "venue_capacity");
                
               
            }
            db.close();
        return venuebean;
    }
}
