package gmailSender;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

/**
 * Servlet implementation class Getdetailsofmail
 */
@MultipartConfig
@WebServlet("/Gmailservlet")

public class Getdetailsofmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * Default constructor. 
     */
    public Getdetailsofmail() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Mailsender emailsender = new Mailsender();
		String from = request.getParameter("fromemail");
		String to = request.getParameter("toemail");
		String subject=request.getParameter("subject");
		String text=request.getParameter("message");
		
		Part file = request.getPart("attachedfile");
		String fileName = file.getSubmittedFileName();
		InputStream fileContent = file.getInputStream();
		

		
		
		boolean b = emailsender.sendEmail(to, from, subject, text , fileContent , fileName);
        if (b) {
            System.out.println("Email is sent successfully");
            request.setAttribute("status", "sent");
            RequestDispatcher rd = request.getRequestDispatcher("Maingmail.jsp");
            rd.forward(request, response);
        } else {
            System.out.println("There is problem in sending email");
            request.setAttribute("status", "error");
            RequestDispatcher rd = request.getRequestDispatcher("Maingmail.jsp");
            rd.forward(request, response);
        }
		
		
	}

}
