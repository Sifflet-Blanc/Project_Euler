public class Main {
    private final int[] tab;

    public static int factoriel(int n) {
        int rep = 1;
        for (int i = 2; i <= n; i++) {
            rep = rep * i;
        }
        return rep;
    }

    public Main(int[] tab) {
        this.tab = tab;
    }

    private int getTab(int i) {
        return this.tab[i];
    }

    private void setTab(int i, int valeur) {
        this.tab[i] = valeur;
    }

    private int length() {
        return this.tab.length;
    }

    private void swap(int i, int j) {
        int tmp = getTab(i);
        setTab(i, getTab(j));
        setTab(j, tmp);
    }

    /**
     * @param j j > i
     */
    private void sorted_swap(int i, int j) {
        for (int k = j; k > i; k--) {
            swap(k, k - 1);
        }
    }

    private void i_eme_permutation_aux(int flag, int i) {
        if (flag < length() - 1) {
            int nb_poss = factoriel(length() - flag) / (length() - flag);
            sorted_swap(flag, i / nb_poss + flag);
            i_eme_permutation_aux(flag + 1, i - nb_poss * (i / nb_poss));
        }
    }

    private void i_eme_permutation(int i) {
        i_eme_permutation_aux(0, i - 1);
    }


    public String to_String() {
        String rep = "";
        for (int i = 0; i < length(); i++) {
            rep += getTab(i);
        }
        return rep;
    }

    public static void main(String[] args) {
        int n = 10;
        int[] tab = new int[n];
        for (int i = 0; i < n; i++) {
            tab[i] = i;
        }
        Main test = new Main(tab);
        test.i_eme_permutation(1000000);
        System.out.println(test.to_String());
    }
}