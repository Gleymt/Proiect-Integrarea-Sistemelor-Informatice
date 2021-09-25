package project.Tranzactii;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet({"/tranzactii","/tranzactii/insert","/tranzactii/delete","/tranzactii/update"})
public class TranzactiiServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private TranzactiiDAO tranzactiiDAO;

    public void init() {
        tranzactiiDAO = new TranzactiiDAO();
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
                case "/tranzactii/insert":
                    insertTranzactii(request, response);
                    insertLog();
                    break;
                case "/tranzactii/delete":
                    deleteTranzactii(request, response);
                    insertLog();
                    break;
                case "/tranzactii/update":
                    updateTranzactii(request, response);
                    insertLog();
                    break;
                default:
                    listTranzactii(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    private void listTranzactii(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Tranzactii> listTranzactii = tranzactiiDAO.selectAllUsers();
        request.setAttribute("listTranzactii", listTranzactii);
        RequestDispatcher dispatcher = request.getRequestDispatcher("tranzactii.jsp");
        dispatcher.forward(request, response);
    }

    private void insertTranzactii(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int codcl = Integer.parseInt(request.getParameter("codcl"));
        String nume = request.getParameter("nume");
        String prenume = request.getParameter("prenume");
        String cnp = request.getParameter("cnp");
        String sumacli = request.getParameter("sumacli");
        String sumacs = request.getParameter("sumacs");


        Tranzactii newTranzactii = new Tranzactii(id,codcl,nume,prenume,cnp,sumacli,sumacs);
        tranzactiiDAO.insertTranzactii(newTranzactii);
        response.sendRedirect("/tranzactii");
    }

    private void updateTranzactii(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        int codcl = Integer.parseInt(request.getParameter("codcl"));
        String cnp = request.getParameter("cnp");
        String sumacli = request.getParameter("sumacli");
        String sumacs = request.getParameter("sumacs");

        Tranzactii tranzactii = new Tranzactii(id, codcl, null, null, cnp, sumacli, sumacs);
        tranzactiiDAO.updateTranzactii(tranzactii);
        response.sendRedirect("/tranzactii");
    }

    private void deleteTranzactii(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        tranzactiiDAO.deleteTranzactii(id);
        response.sendRedirect("/tranzactii");

    }

    private void insertLog() throws SQLException {
        tranzactiiDAO.insertLog();

    }

}