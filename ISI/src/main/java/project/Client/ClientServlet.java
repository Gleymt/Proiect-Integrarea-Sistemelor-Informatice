package project.Client;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/client","/client/insert","/client/delete","/client/update"})
public class ClientServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClientDAO clientDAO;

    public void init() {
        clientDAO = new ClientDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/client/insert":
                    insertClient(request, response);
                    insertLog();
                    break;
                case "/client/delete":
                    deleteClient(request, response);
                    insertLog();
                    break;
                case "/client/update":
                    updateClient(request, response);
                    insertLog();
                    break;
                default:
                    listClient(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listClient(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Client> listClient = clientDAO.selectAllUsers();
        request.setAttribute("listClient", listClient);
        RequestDispatcher dispatcher = request.getRequestDispatcher("clienti.jsp");
        dispatcher.forward(request, response);
    }

    private void insertClient(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int codcl = Integer.parseInt(request.getParameter("codcl"));
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String cetatenie = request.getParameter("cetatenie");
        String datan = request.getParameter("datan");


        Client newClient = new Client(codcl,nume,prenume,cetatenie,datan);
        clientDAO.insertClient(newClient);
        response.sendRedirect("/client");
    }

    private void updateClient(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int codcl = Integer.parseInt(request.getParameter("codcl"));
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String cetatenie = request.getParameter("cetatenie");
        String datan = request.getParameter("datan");

        Client client = new Client(codcl,nume, prenume, cetatenie, datan);
        clientDAO.updateClient(client);
        response.sendRedirect("/client");
    }

    private void deleteClient(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int codcl = Integer.parseInt(request.getParameter("codcl"));
        clientDAO.deleteClient(codcl);
        response.sendRedirect("/client");

    }

    private void insertLog() throws SQLException {
        clientDAO.insertLog();

    }

}