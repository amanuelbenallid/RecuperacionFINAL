package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import clases.JugadoresDAO;

/**
 * Servlet implementation class CreateJugador
 */
@WebServlet("/CreateJugador")
public class CreateJugador extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateJugador() {
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
		Integer equipo=Integer.parseInt(request.getParameter("equipo"));
		String nombre = request.getParameter("nombre");
		String apellidos= request.getParameter("apellido");
		String direccion= request.getParameter("Direccion");
		String dni= request.getParameter("dni");
		
		JugadoresDAO.createjugador(nombre, apellidos, dni, direccion, equipo);
		getServletContext().getRequestDispatcher("/Read").forward(request, response);
		
	}

}
