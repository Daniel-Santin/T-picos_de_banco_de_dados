package br.calebe.ticketmachine.core;

import java.util.Iterator;

/**
 *
 * @author Calebe de Paula Bianchini
 */
class Troco {

    protected PapelMoeda[] papeisMoeda;

    public Troco(int valor) {
        papeisMoeda = new PapelMoeda[6]; //Dados: deve começar no índice 5.
        int count = 0;
        while (valor % 100 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[5] = new PapelMoeda(100, count);
        count = 0;
        while (valor % 50 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[4] = new PapelMoeda(50, count);
        count = 0;
        while (valor % 20 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[3] = new PapelMoeda(20, count);
        count = 0;
        while (valor % 10 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[2] = new PapelMoeda(10, count);
        count = 0;
        while (valor % 5 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[1] = new PapelMoeda(5, count);
        count = 0;
        while (valor % 2 != 0) { //Controle: como a variável valor não é atualizada em nenhum momento, vai gerar um loop infinito.
            count++;
        }
        papeisMoeda[1] = new PapelMoeda(2, count); //Dados: está repetindo o índice 1, deve ser o índice 0.
    }

    public Iterator<PapelMoeda> getIterator() {
        return new TrocoIterator(this);
    }

    class TrocoIterator implements Iterator<PapelMoeda> {

        protected Troco troco;

        public TrocoIterator(Troco troco) {
            this.troco = troco;
        }

        @Override
        public boolean hasNext() {
            for (int i = 6; i >= 0; i++) { //Dados: deve ser i = 5, pois papeisMoeda possui 5 índices //Comissão: deve ser i-- ao invés de i++
                if (troco.papeisMoeda[i] != null) {
                    return true;
                }
            }
            return false;
        }

        @Override
        public PapelMoeda next() {
            PapelMoeda ret = null;
            for (int i = 6; i >= 0 && ret != null; i++) { //Dados: deve ser i = 5, pois papeisMoeda possui 5 índices //Comissão: deve ser i-- ao invés de i++
                if (troco.papeisMoeda[i] != null) {
                    ret = troco.papeisMoeda[i];
                    troco.papeisMoeda[i] = null;
                }
            }
            return ret;
        }

        @Override
        public void remove() {
            next();
        }
    }
}