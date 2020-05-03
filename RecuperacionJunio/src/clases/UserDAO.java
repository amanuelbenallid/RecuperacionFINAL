package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conector.ConnectionDB;

public class UserDAO {
	// ESTE METODO SIRVE PARA COMPROBAR LAS CREDENCIALES DE ACCESO
	public static boolean checkUser(String username, String password) {
		boolean found = false;
		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("select username, password from usuario where username=? and password=?");
			stmt.setString(1, username);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			found = rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return found;
	}

	// ESTE METODO SIRVE PARA COMPROBAR EL ROLE QUE TIENE EL USUARIO
	public static String checkRole(String username, String password) {
		String role = null;
		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c.prepareStatement(
					"Select role FROM usuario WHERE username ='" + username + "' and password='" + password + "'");
			ResultSet rs = stmt.executeQuery();

			while (rs.next())

				role = rs.getString(1);
			rs.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return role;
	}

	// ESTE METODO SIRVE PARA CREAR UN NUEVO USUARIO
	public static void createuser(String username, String password, String fullname, String fechanac, String role) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("INSERT INTO usuario (username,password,fullname, dateOfBirth,role ) Values('"
							+ username + "','" + password + "','" + fullname + "','" + fechanac + "','" + role + "')");
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ESTE METODO SIRVE PARA BORRAR UN USUARIO
	public static void deleteuser(Integer idusuario) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c.prepareStatement("Delete from usuario where id =" + idusuario);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// este metodo sirve para leer los usuarios de la BD
	public static List<User> readUsuarios() {

		List<User> usuarios = null;
		try {
			Connection con = ConnectionDB.conectarMySQL();
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from usuario");
			usuarios = new ArrayList<User>();

			while (rs.next())
				usuarios.add(new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getDate(5), rs.getString(6)));

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return usuarios;
	}

//este metodo cambia el role de un usuario
	public static void updaterole(Integer user_id, String roleantiguo) {
		
		Connection c = ConnectionDB.conectarMySQL();
	    try {
	        if(roleantiguo.equals("user")){
	            PreparedStatement stmt = c.prepareStatement("UPDATE usuario SET role= 'admin' WHERE id=" + user_id + "");
	        stmt.executeUpdate();
	        }else {
	            PreparedStatement stmt = c.prepareStatement("UPDATE usuario SET role= 'user' WHERE id=" + user_id + "");
	        stmt.executeUpdate();
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	}
	
}
