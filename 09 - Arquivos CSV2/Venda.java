import java.io.BufferedReader;
import java.io.FileReader;

public class Venda{
    public static void main(String[] args) throws Exception{
        String nomeArquivo = "vendas.csv";
        BufferedReader arqLeitura = new BufferedReader(new FileReader(nomeArquivo));
        String linha = arqLeitura.readLine();

        float venda;
        int contVenda = 0;
        int totalVendas = 0;
        int totalVista = 0;
        int totalPrazo = 0;

        while((linha = arqLeitura.readLine()) != null){
            String[] coluna = linha.split(";"); //Corta a colunas a cada ";"
            venda = Float.valueOf(coluna[2].replace(",", ".")); //Substitui "," do csv pro ".";
            totalVendas += venda;
            contVenda++;

            if(coluna[3].equals("V")){
                totalVista += venda;
            }else{
                totalPrazo += venda;    
            } 

        }

        System.out.println("A quantidade vendas foi: " + contVenda);
        System.out.println("O valor total das vendas foi: " + totalVendas);
        System.out.println("O valor total das que foram a vista foi: " + totalVista);
        System.out.println("O valor total das que foram a prazo foi: " + totalPrazo);
        arqLeitura.close();
    }
}