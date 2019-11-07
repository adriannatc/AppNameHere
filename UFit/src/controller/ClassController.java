package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClassDao;
import model.Class;

@WebServlet("/ClassController")
public class ClassController extends HttpServlet {
	/**
	 * This gclass handles all insert/edit/list functions of the servlet.
	 * 
	 * These are variables that lead to the appropriate JSP pages. INSERT leads
	 * to the Add A Class page. EDIT leads to the Edit A Class page.
	 * LIST_CLASS_PUBLIC leads to the public listing of gclasss.
	 * LIST_CLASS_ADMIN leads to the admin-only listing of gclasss (for them
	 * to modify gclass information).
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static String INSERT = "/adminaddClass.jsp";
	private static String EDIT = "/admineditClass.jsp";
	private static String LIST_CLASS_PUBLIC = "/listClassPublic.jsp";
	private static String LIST_CLASS_ADMIN = "/adminlistClass.jsp";

	private ClassDao dao;

	/**
	 * Constructor for this gclass.
	 */
	public ClassController() {
		super();
		dao = new ClassDao();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/**
		 * This gclass retrieves the appropriate 'action' found on the JSP pages:
		 * 
		 * - delete will direct the servlet to let the user delete a gclass in
		 * the database. - insert will direct the servlet to let the user add a
		 * new gclass to the database. - edit will direct the servlet to let
		 * the user edit gclass information in the database. - listClass will
		 * direct the servlet to the public listing of all gclasss in the
		 * database. - listClassAdmin will direct the servlet to the admin
		 * listing of all gclasss in the database.
		 */
		String forward = "";
		String action = request.getParameter("action");

		if (action.equalsIgnoreCase("delete")) {
			int gclassId = Integer.parseInt(request.getParameter("gclassId"));
			dao.deleteClass(gclassId);
			forward = LIST_CLASS_ADMIN;
			request.setAttribute("gclasses", dao.getAllClasses());
		} else if (action.equalsIgnoreCase("insert")) {
			forward = INSERT;
		} else if (action.equalsIgnoreCase("edit")) {
			forward = EDIT;
			int gclassId = Integer.parseInt(request.getParameter("gclassId"));
			Class gclass = dao.getClassById(gclassId);
			request.setAttribute("gclass", gclass);
		} else if (action.equalsIgnoreCase("listClass")) {
			forward = LIST_CLASS_PUBLIC;
			request.setAttribute("gclasses", dao.getAllClasses());
		} else if (action.equalsIgnoreCase("listClassAdmin")) {
			forward = LIST_CLASS_ADMIN;
			request.setAttribute("gclasses", dao.getAllClasses());
		} else {
			forward = INSERT;
		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		/**
		 * This method retrieves all of the information entered in the form on
		 * the addClass.jsp or the editClass.jsp pages.
		 */
		Class gclass = new Class();
		gclass.setCategory(request.getParameter("category"));
		gclass.setLocation(request.getParameter("location"));
		try {
			Date gdate = new SimpleDateFormat("MM/dd/yyyy").parse(request
					.getParameter("gdate"));
			gclass.setGdate(gdate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		gclass.setLevel(request.getParameter("level"));
		String gclassid = request.getParameter("classid");
		/**
		 * If the 'gclassid' field in the form is empty, the new gclass will
		 * be added to the list of Class objects.
		 */
		if (gclassid == null || gclassid.isEmpty()) {
			dao.addClass(gclass);
		} else {
			/**
			 * Otherwise, if the field is already filled (this occurs when the
			 * user is trying to Edit A Class), then the gclass's information
			 * will be updated accordingly.
			 */
			gclass.setClassid(Integer.parseInt(gclassid));
			dao.updateClass(gclass);
		}
		/**
		 * Once the gclass has been added or updated, the page will redirect to
		 * the listing of gclasss.
		 */
		RequestDispatcher view = request
				.getRequestDispatcher(LIST_CLASS_ADMIN);
		request.setAttribute("gclasses", dao.getAllClasses());
		view.forward(request, response);
	}
}