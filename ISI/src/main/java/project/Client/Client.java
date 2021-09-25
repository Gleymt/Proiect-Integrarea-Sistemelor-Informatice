package project.Client;

public class Client {
    private int codcl;
    private String nume;
    private String prenume;
    private String cetatenie;
    private String datan;

    public Client(int codcl, String nume, String prenume, String cetatenie, String datan) {
        super();
        this.codcl = codcl;
        this.nume = nume;
        this.prenume = prenume;
        this.cetatenie = cetatenie;
        this.datan = datan;

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

    public void setCetatenie(String cetatenie) {
        this.cetatenie = cetatenie;
    }

    public void setDatan(String datan) {
        this.datan = datan;
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

    public String getCetatenie() {
        return cetatenie;
    }

    public String getDatan() {
        return datan;
    }
}
