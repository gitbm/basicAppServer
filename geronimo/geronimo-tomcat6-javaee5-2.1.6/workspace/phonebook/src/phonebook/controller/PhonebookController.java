
package phonebook.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/*
 * PhonebookController.java
 *
 * This class is a simple Spring Controller. This controller is registered as a
 * Bean in the Phonebook ApplicationContext.
 *
 * @author Arun Chatpar
 * @version 1.0
 */
public class PhonebookController implements Controller{

    /** Creates a new instance of AddressBookController */
    public PhonebookController() {
    }

    public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException
    {

        return new ModelAndView("/WEB-INF/jsp/home.jsp");
    }

}
