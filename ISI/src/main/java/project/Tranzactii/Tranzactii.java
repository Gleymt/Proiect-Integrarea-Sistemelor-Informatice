package project.Tranzactii;

public class Tranzactii {
    private int id;
    private int codcl;
    private String nume;
    private String prenume;
    private String cnp;
    private String sumacli;
    private String sumacs;

    public Tranzactii(int id, int codcl, String nume, String prenume, String cnp, String sumacli, String sumacs) {
        this.id = id;
        this.codcl = codcl;
        this.nume = nume;
        this.prenume = prenume;
        this.cnp = cnp;
        this.sumacli = sumacli;
        this.sumacs = sumacs;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setCodcl(int codcl) {
        this.codcl = codcl;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public void setPrenume(String prenume) {
        this.prenume = prenume;
    }

    public void setCnp(String cnp) {
        this.cnp = cnp;
    }

    public void setSumacli(String sumacli) {
        this.sumacli = sumacli;
    }

    public void setSumacs(String sumacs) {
        this.sumacs = sumacs;
    }

    public int getId() {
        return id;
    }

    public int getCodcl() {
        return codcl;
    }

    public String getNume() {
        return nume;
    }

    public String getPrenume() {
        return prenume;
    }

    public String getCnp() {
        return cnp;
    }

    public String getSumacli() {
        return sumacli;
    }

    public String getSumacs() {
        return sumacs;
    }


}
