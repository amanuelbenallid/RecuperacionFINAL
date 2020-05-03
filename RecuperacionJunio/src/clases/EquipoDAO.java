package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conector.ConnectionDB;

public class EquipoDAO {

	// Este método sirve para leer los equipos de la BD
	public static List<Equipo> readEquipo() {

		List<Equipo> equipos = null;
		try {
			Connection con = ConnectionDB.conectarMySQL();
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from equipo");
			equipos = new ArrayList<Equipo>();

			while (rs.next())
				equipos.add(new Equipo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4)));

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return equipos;
	}

	// ESTE METODO SIRVE PARA BORRAR EL EQUIPO DESEADO
	public static void deleteequipo(Integer idequipo) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stm = c.prepareStatement("update jugador set equipo =null where equipo="+idequipo);
			stm.executeUpdate();
			PreparedStatement stmt = c.prepareStatement("Delete from equipo where id =" + idequipo);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ESTE METODO SIRVE PARA ACTUALIZAR EL EQUIPO 
	public static void updateequipo(Integer id ,String nombre,String  ciudad,String  pais) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("UPDATE equipo SET nombre='"+ nombre + "', ciudad='"+ciudad+"', pais='"+ pais+"' WHERE id="+id);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
	// ESTE METODO SIRVE PARA CREAR EL EQUIPO 
		public static void crearequipo(String nombre,String  ciudad,String  pais) {

			Connection c = ConnectionDB.conectarMySQL();
			try {
				PreparedStatement stmt = c
						.prepareStatement("INSERT INTO equipo (nombre , ciudad ,pais ) Values('"+ nombre + "','" + ciudad + "','" + pais + "')");
				stmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			}

		}
}
