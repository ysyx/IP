/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

/**
 *
 * @author Kiwi
 */
public class Pair<L,R> {
    private L left;
    private R right;
    
    public Pair() {}

    public Pair(L left, R right) {
        this.left = left;
        this.right = right;
    }
    
    public Pair(Pair<L, R> that) {
        this.left = that.left;
        this.right = that.right;
    }

    public L getLeft() { return left; }
    public R getRight() { return right; }
    
    public void setLeft(L left) { this.left = left; }
    public void setRight(R right) { this.right = right; }

    @Override
    public int hashCode() { return left.hashCode() ^ right.hashCode(); }

    @Override
    public boolean equals(Object o) {
        if (!(o instanceof Pair)) return false;
        Pair pairo = (Pair) o;
        return this.left.equals(pairo.getLeft()) && this.right.equals(pairo.getRight());
    }
    
    public String toFraction() {
        return left + " / " + right;
    }
}
