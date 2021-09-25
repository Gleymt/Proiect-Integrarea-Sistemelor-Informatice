package project.Client;

import project.DB;
import project.Log.Log;
import project.Tranzactii.Tranzactii;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ClientDAO {

    public Log log = Log.getInstance();
    private static final String SELECT_ALL_CLIENTS = "select * from client";
    private static final String UPDATE_CLIENTS = "update client set nume = ?, prenume= ?, cetatenie= ?, datan= ? where codcl = ?";
    private static final String DELETE_CLIENTS = "delete from client where codcl = ?";
    private static final String INSERT_CLIENTS = "INSERT INTO client (codcl,nume, prenume, cetatenie, datan) VALUES (?,?, ?, ?, ?)";
    private static final String INSERT_LOG = "INSERT INTO logs (username, table_name, table_row, command) VALUES (? ,? ,? ,?)";

    protected Connection getConnection() {
        DB db = new DB();
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(db.URL,db.User, db.Password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return connection;
    }

    public void insertClient(Client client) throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_CLIENTS)) {
            preparedStatement.setInt(1, client.getCodcl());
            preparedStatement.setString(2, client.getNume());

            preparedStatement.setString(3, client.getPrenume());
            preparedStatement.setString(4, client.getCetatenie());
            preparedStatement.setString(5, client.getDatan());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }

        log.setCommand("insert");
        log.setTable_row(String.valueOf(client.getCodcl()));
    }


    public List<Client> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Client> clients = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_CLIENTS);) {

            // Step 3: Execute the query or update query
            ResultSet rs = preparedStatement.executeQuery();

            // Step 4: Process the ResultSet object.
            while (rs.next()) {
                int codcl = rs.getInt("codcl");
                String nume = rs.getString("nume");
                String prenume = rs.getString("prenume");
                String cetatenie = rs.getString("cetatenie");
                String datan = rs.getString("datan");
                clients.add(new Client(codcl, nume, prenume, cetatenie,datan));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return clients;
    }
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }

    public void insertLog() throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LOG)) {
            log.setTable_name("client");
            preparedStatement.setString(1, log.getUsername());
            preparedStatement.setString(2, log.getTable_name());
            preparedStatement.setString(3, log.getTable_row());
            preparedStatement.setString(4, log.getCommand());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }

    }

    public void updateClient(Client client) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_CLIENTS)){

            statement.setString(1, client.getNume());
            statement.setString(2, client.getPrenume());
            statement.setString(3, client.getCetatenie());
            statement.setString(4, client.getDatan());
            statement.setInt(5, client.getCodcl());

            statement.executeUpdate();

            log.setCommand("update");
            log.setTable_row(String.valueOf(client.getCodcl()));

        }
    }

    public void deleteClient(int codcl) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_CLIENTS)) {
            statement.setInt(1, codcl);
            statement.executeUpdate();
        }

        log.setCommand("delete");
        log.setTable_row(String.valueOf(codcl));
    }


}