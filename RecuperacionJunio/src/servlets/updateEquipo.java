package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.EquipoDAO;

/**
 * Servlet implementation class updateEquipo
 */
@WebServlet("/updateEquipo")
public class updateEquipo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateEquipo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Integer equipo_id=Integer.parseInt(request.getParameter("equipo_id"));
		String equipo_nombre=request.getParameter("equipo_nombre");
		String equipo_ciudad=request.getParameter("equipo_ciudad");
		String equipo_pais=request.getParameter("equipo_pais");

		EquipoDAO.updateequipo(equipo_id, equipo_nombre, equipo_ciudad, equipo_pais);
		
		getServletContext().getRequestDispatcher("/Read").forward(request, response);
	}

}
