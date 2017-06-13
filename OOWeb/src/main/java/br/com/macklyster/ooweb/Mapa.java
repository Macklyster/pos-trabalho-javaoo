package br.com.macklyster.ooweb;

public class Mapa {
    
    private Lugar lugarInicialJogador;
    private Lugar lugarInicialNPC;
    
    public Mapa() {
        criaLugares();
    }

    private void criaLugares() {
        Lugar sala = new Lugar("sala");
        sala.setImagem("sala.jpg");
        Lugar copa = new Lugar("copa");
        copa.setImagem("copa.jpg");
        Lugar corredor = new Lugar("corredor");
        corredor.setImagem("corredor.jpg");
        Lugar cozinha = new Lugar("cozinha");
        cozinha.setImagem("cozinha.jpg");
        Lugar quarto = new Lugar("quarto");
        quarto.setImagem("quarto.jpg");
        Lugar banheiro = new Lugar("banheiro");
        banheiro.setImagem("banheiro.jpg");
        sala.setSul(copa);
        copa.setNorte(sala);
        copa.setSul(cozinha);
        cozinha.setNorte(copa);
        sala.setOeste(corredor);
        copa.setOeste(corredor);
        cozinha.setOeste(corredor);
        corredor.setLeste(copa);
        corredor.setNorte(quarto);
        quarto.setSul(corredor);
        corredor.setSul(banheiro);
        banheiro.setNorte(corredor);
        lugarInicialJogador = sala;
        lugarInicialNPC = cozinha;
    }

    public Lugar getLugarInicialJogador() {
        return lugarInicialJogador;
    }

    public Lugar getLugarInicialNPC() {
        return lugarInicialNPC;
    }
    

}
