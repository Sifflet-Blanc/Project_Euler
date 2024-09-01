import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Main {
    private final List<Integer> n;
    private final List<Integer> n1;
    private final List<Integer> tmp;
    private int i = 2;

    public Main(){
        this.n = new ArrayList<>(1000);
        this.n1 = new ArrayList<>(1000);
        this.tmp = new ArrayList<>(1000);
        n.add(1);
        n1.add(1);
    }

    private int getNLenght(){
        return this.n.size();
    }

    private int getI(){
        return this.i;
    }

    private void next(){
        /*fait en sorte que tmp = n */
        this.tmp.clear();
        for(Integer i : n){
            tmp.add(i);
        }
        n.clear();

        /*fait en sorte que n = tmp+n1 */
        int retenue = 0;
        Iterator<Integer> itern = tmp.iterator();
        Iterator<Integer> itern1 = n1.iterator();
        while(itern1.hasNext()){
            retenue += itern1.next()+itern.next();
            n.add(retenue % 10);
            retenue = retenue / 10;
        }
        while(itern.hasNext()){
            retenue += itern.next();
        }
        while (retenue > 0) {
            n.add(retenue % 10);
            retenue = retenue / 10;
        }
        /*fait en sorte que n1 = tmp */
        this.n1.clear();
        for(Integer i : tmp){
            n1.add(i);
        }
        this.i++;
    }

    public void printN(){
        for(Integer i : n){
            System.out.print(i);
        }
        System.out.println();
    }

    /**
     * @param k >=2
     */
    public int getIndexOfFirstFiboWithKDigit(int k){
        while(getNLenght() < k){
            //printN();
            next();
        }
        return getI();
    }

    public static void main(String[] args){
        Main rep = new Main();
        System.out.println("\n"+rep.getIndexOfFirstFiboWithKDigit(1000));
    }
}