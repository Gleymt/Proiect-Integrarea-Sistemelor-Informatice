package project.Tranzactii;

import project.DB;
import project.Log.Log;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TranzactiiDAO {

    public Log log = Log.getInstance();
    private static final String UPDATE_TRANZACTII = "update tranzactii set codcl= ?, cnp =?, sumacli=?, sumacs=? where id = ?";
    private static final String DELETE_TRANZACTII = "delete from tranzactii where id = ?";
    private static final String SELECT_ALL_TRANZACTII = "select * from tranzactii";
    private static final String SELECT_FROM_CLIENT = "select * from client where codcl=?";
    private static final String INSERT_TRANZACTII = "INSERT INTO tranzactii (id,codcl, cnp, sumacli, sumacs) VALUES (?,?, ?, ?, ?)";
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

    public void insertTranzactii(Tranzactii tranzactii) throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_TRANZACTII)) {
            preparedStatement.setInt(1, tranzactii.getId());
            preparedStatement.setInt(2, tranzactii.getCodcl());
            preparedStatement.setString(3, tranzactii.getCnp());

            preparedStatement.setString(4, tranzactii.getSumacli());
            preparedStatement.setString(5, tranzactii.getSumacs());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }

        log.setCommand("insert");
        log.setTable_row(String.valueOf(tranzactii.getId()));
    }

    public List<Tranzactii> selectAllUsers() {

        // using try-with-resources to avoid closing resources (boiler plate code)
        List<Tranzactii> tranzactii = new ArrayList<>();
        // Step 1: Establishing a Connection
        try (Connection connection = getConnection();

             // Step 2:Create a statement using connection object
             PreparedStatement preparedStatement2 = connection.prepareStatement(SELECT_FROM_CLIENT);
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_TRANZACTII)) {
            // Step 3: Execute the query or update query

            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()){
                int id = rs.getInt("id");
                int codcl = rs.getInt("codcl");
                String cnp = rs.getString("cnp");
                String sumacli = rs.getString("sumacli");
                String sumacs = rs.getString("sumacs");

                preparedStatement2.setInt(1, codcl);
                ResultSet rs2 = preparedStatement2.executeQuery();

                if(rs2.next()) {
                    String nume = rs2.getString("nume");
                    String prenume = rs2.getString("prenume");

                    tranzactii.add(new Tranzactii(id, codcl, nume, prenume, cnp, sumacli, sumacs));
                }

            }
        } catch (SQLException e) {
            printSQLException(e);
        }

        return tranzactii;
    }

    public void deleteTranzactii(int id) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_TRANZACTII)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }

        log.setCommand("delete");
        log.setTable_row(String.valueOf(id));
    }

    public void updateTranzactii(Tranzactii tranzactii) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_TRANZACTII)){
            statement.setInt(1, tranzactii.getCodcl());
            statement.setString(2, tranzactii.getCnp());
            statement.setString(3, tranzactii.getSumacli());
            statement.setString(4, tranzactii.getSumacs());
            statement.setInt(5, tranzactii.getId());

            statement.executeUpdate();

            log.setCommand("update");
            log.setTable_row(String.valueOf(tranzactii.getId()));

        }
    }

    public void insertLog() throws SQLException {
        // try-with-resource statement will auto close the connection.
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_LOG)) {
            log.setTable_name("tranzactii");
            preparedStatement.setString(1, log.getUsername());
            preparedStatement.setString(2, log.getTable_name());
            preparedStatement.setString(3, log.getTable_row());
            preparedStatement.setString(4, log.getCommand());
            preparedStatement.executeUpdate();

        } catch (SQLException e) {
            printSQLException(e);
        }

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
}