package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.VenueBean;
import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

@MultipartConfig
public class VenueController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        
        HttpSession sess = request.getSession(true);
        if(sess.getAttribute("USERID") != null){
            String userPath = request.getServletPath();
            if(userPath.equals("/venue/addvenue")){
                request.getRequestDispatcher("/WEB-INF/admin/add_venue.jsp").include(request, response);
            }else if(userPath.equals("/venue/deletevenue")){
                VenueBean venue_bean = new VenueBean();
                venue_bean.setPk_id(request.getParameter("venue_id"));
                venue_bean.delete_venue();

                response.sendRedirect("../home");
            }else if(userPath.equals("/venue/editvenue")){
                VenueBean venue_bean = new VenueBean();
                venue_bean.setPk_id(request.getParameter("venue_id"));
                venue_bean.merge();

                request.setAttribute("venue_bean", venue_bean);

                request.getRequestDispatcher("/WEB-INF/admin/edit_venue.jsp").include(request, response);
            }else if(userPath.equals("/venue/editimage")){
                List imageUrlList = new ArrayList(); 
                VenueBean venue_bean = new VenueBean();
                venue_bean.setPk_id(request.getParameter("venue_id"));
                venue_bean.merge();
                File imageDir = new File(getServletContext().getRealPath("/")+"../../web/"+venue_bean.getVenue_image());  
                for(File imageFile : imageDir.listFiles()){  
                  String imageFileName = imageFile.getName();  

                  // add this images name to the list we are building up  
                  imageUrlList.add(imageFileName);  
                  
                }  request.setAttribute("a", "b");
                request.setAttribute("imageUrlList", imageUrlList);  
                request.getRequestDispatcher("/WEB-INF/admin/edit_image.jsp").forward(request, response);
            }else if(userPath.equals("/venue/deleteimage")){
                String image_id = request.getParameter("image_id");
                String venue_id = request.getParameter("venue_id");
                VenueBean venue_bean = new VenueBean();
                venue_bean.setPk_id(venue_id);
                venue_bean.merge();

                File f = new File(getServletContext().getRealPath("/")+"../../web/"+venue_bean.getVenue_image()+"/"+image_id);
                f.delete();
                response.sendRedirect("../venue/editimage?venue_id="+venue_id);
            }else{
                response.sendRedirect("../account");
            }
        }else{
            response.sendRedirect("../account");
        }
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        String userPath = request.getServletPath();
        if(userPath.equals("/venue/savevenue")){
            VenueBean venue_bean = new VenueBean();
            venue_bean.setVenue_name(request.getParameter("venue_name"));
            venue_bean.setVenue_description(request.getParameter("venue_description"));
            venue_bean.setVenue_image("Image");
            venue_bean.setVenue_size(request.getParameter("venue_size"));
            venue_bean.setVenue_capacity(request.getParameter("venue_capacity"));
            venue_bean.add_venue();
            
            venue_bean.merge_id();
  response.getWriter().println(venue_bean.getPk_id());
            String dir = venue_bean.getPk_id();
                    dir = dir.replaceAll("\\s", "");

                    String fileUploadPath = getServletContext().getRealPath("/")+"../../web/asset/images/"  + dir + "/";
                    File fileUploadDir = new File(fileUploadPath);
                    if(!fileUploadDir.exists()) {
                        fileUploadDir.mkdirs();
                    }

                    response.getWriter().println(venue_bean.getPk_id());
                    
                    
                    venue_bean.setVenue_image("asset/images/"+dir+"/");
                    venue_bean.save_edited2();
                    
                    
            
            response.sendRedirect("../home");
        }else if(userPath.equals("/venue/savededit")){
           VenueBean venue_bean = new VenueBean();
            venue_bean.setPk_id(request.getParameter("venue_id"));
            venue_bean.setVenue_name(request.getParameter("venue_name"));
            venue_bean.setVenue_description(request.getParameter("venue_description"));
            venue_bean.setVenue_image("Image");
            venue_bean.setVenue_size(request.getParameter("venue_size"));
            venue_bean.setVenue_capacity(request.getParameter("venue_id"));
            venue_bean.save_edited();
                
            response.sendRedirect("../home");
        }else if(userPath.equals("/venue/addimage")){
            HttpSession session = request.getSession();
            session.setAttribute("href", null);
            session.setAttribute("dir", "A");

            boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
            if(isMultipartContent) {

                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {

                    List<FileItem> fields = upload.parseRequest(request); 
                    Iterator<FileItem> it = fields.iterator();
                    FileItem fileItem = null; 
                    if(!it.hasNext()) {
                        throw new Exception("No fields provided");
                    }

                    while(it.hasNext()) {
                        FileItem field = it.next();
                        if(field.isFormField()) {
                            String fieldName = field.getFieldName();
                            String fieldValue = field.getString();
                            if(fieldName.equals("venue_id")) {
                                session.setAttribute("venue_id", fieldValue);
                            }
                        }
                        else {
                            fileItem = field;
                        }
                    }

                    if(fileItem == null) {
                       throw new Exception("Not a File"); 
                    }

                    String dir = (String) session.getAttribute("venue_id");
                    dir = dir.replaceAll("\\s", "");

                    String fileUploadPath = getServletContext().getRealPath("/")+"../../web/asset/images/"  + dir + "/";
                    File fileUploadDir = new File(fileUploadPath);
                    if(!fileUploadDir.exists()) {
                        fileUploadDir.mkdirs();
                    }

                    String fileName = fileItem.getName().substring(0,fileItem.getName().length())
                                        .replace(" ", "_").replace("%", "_").replace(".","_");

                    File uploadedFile = new File(fileUploadPath + fileName);

                    fileItem.write(uploadedFile);
                    fileItem.delete();
                    
                    VenueBean venue_bean = new VenueBean();
                    venue_bean.setPk_id(dir);
                    venue_bean.setVenue_image("asset/images/"+dir+"/");
                    response.getWriter().println(venue_bean.getVenue_image());

                    response.sendRedirect("../venue/editimage?venue_id="+dir);
                    
                } catch(Exception e) {
                }
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
