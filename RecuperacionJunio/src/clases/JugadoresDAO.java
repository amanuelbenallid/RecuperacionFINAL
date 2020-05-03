package clases;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import conector.ConnectionDB;

public class JugadoresDAO {
	// este metodo sirve para leer los jugadores de la BD
	public static List<Jugadores> readJugadores() {

		List<Jugadores> jugadores = null;
		try {
			Connection con = ConnectionDB.conectarMySQL();
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery("select * from jugador");
			jugadores = new ArrayList<Jugadores>();

			while (rs.next())
				jugadores.add(new Jugadores(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),
						rs.getString(5), rs.getInt(6)));

			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return jugadores;
	}

	// ESTE METODO SIRVE PARA CREAR UN NUEVO JUGADOR
	public static void createjugador(String nombre, String apellidos, String dni, String direccion, Integer equipo) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("INSERT INTO jugador (nombre , apellidos ,dni, direccion, equipo ) Values('"
							+ nombre + "','" + apellidos + "','" + dni + "','" + direccion + "'," + equipo + ")");
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ESTE METODO SIRVE PARA ACTUALIZAR EL EQUIPO DE UN JUGADOR
	public static void updatejugador(Integer idjugador, Integer equiponuevo) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c.prepareStatement("UPDATE jugador SET equipo=" +equiponuevo + " WHERE id=" + idjugador + "");
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	// ESTE METODO SIRVE PARA BORRAR EL JUGADOR DESEADO
	public static void deletejugador(Integer idjugador) {

		Connection c = ConnectionDB.conectarMySQL();
		try {
			PreparedStatement stmt = c
					.prepareStatement("Delete from jugador where id ="+idjugador);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
