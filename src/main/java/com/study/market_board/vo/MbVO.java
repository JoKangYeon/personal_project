package com.study.market_board.vo;

public class MbVO {

    private int mbNo;               /* 글번호 */
    private String mbProduct;
    private String mbTitle;
    private String mbCategory;
    private int mbPrice;
    private String mbWriter;
    private String mbContent;
    private int mbHit;
    private String mbRegDate;
    private String mbModDate;
    private String mbDelYn;

    @Override
    public String toString() {
        return "MbVO{" +
                "mbNo=" + mbNo +
                ", mbProduct='" + mbProduct + '\'' +
                ", mbTitle='" + mbTitle + '\'' +
                ", mbCategory='" + mbCategory + '\'' +
                ", mbPrice=" + mbPrice +
                ", mbWriter='" + mbWriter + '\'' +
                ", mbContent='" + mbContent + '\'' +
                ", mbHit=" + mbHit +
                ", mbRegDate='" + mbRegDate + '\'' +
                ", mbModDate='" + mbModDate + '\'' +
                ", mbDelYn='" + mbDelYn + '\'' +
                '}';
    }

    public int getMbNo() {
        return mbNo;
    }

    public void setMbNo(int mbNo) {
        this.mbNo = mbNo;
    }

    public String getMbProduct() {
        return mbProduct;
    }

    public void setMbProduct(String mbProduct) {
        this.mbProduct = mbProduct;
    }

    public String getMbTitle() {
        return mbTitle;
    }

    public void setMbTitle(String mbTitle) {
        this.mbTitle = mbTitle;
    }

    public String getMbCategory() {
        return mbCategory;
    }

    public void setMbCategory(String mbCategory) {
        this.mbCategory = mbCategory;
    }

    public int getMbPrice() {
        return mbPrice;
    }

    public void setMbPrice(int mbPrice) {
        this.mbPrice = mbPrice;
    }

    public String getMbWriter() {
        return mbWriter;
    }

    public void setMbWriter(String mbWriter) {
        this.mbWriter = mbWriter;
    }

    public String getMbContent() {
        return mbContent;
    }

    public void setMbContent(String mbContent) {
        this.mbContent = mbContent;
    }

    public int getMbHit() {
        return mbHit;
    }

    public void setMbHit(int mbHit) {
        this.mbHit = mbHit;
    }

    public String getMbRegDate() {
        return mbRegDate;
    }

    public void setMbRegDate(String mbRegDate) {
        this.mbRegDate = mbRegDate;
    }

    public String getMbModDate() {
        return mbModDate;
    }

    public void setMbModDate(String mbModDate) {
        this.mbModDate = mbModDate;
    }

    public String getMbDelYn() {
        return mbDelYn;
    }

    public void setMbDelYn(String mbDelYn) {
        this.mbDelYn = mbDelYn;
    }
}
