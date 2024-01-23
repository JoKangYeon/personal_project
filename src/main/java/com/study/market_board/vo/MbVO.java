package com.study.market_board.vo;

import com.study.common.attach.vo.AttachVO;

import java.util.Arrays;
import java.util.List;

public class MbVO {

    private int mbNo;               /* 글번호 */
    private String mbProduct;       /* 상품명 */
    private String mbTitle;         /* 글제목 */
    private String mbCategory;      /* 글분류 */
    private int mbPrice;            /* 상품가격 */
    private String mbWriter;        /* 글 작성자 */
    private String mbContent;       /* 글 내용 */
    private int mbHit;              /* 글 조회수 */
    private String mbRegDate;       /* 작성일 */
    private String mbModDate;       /* 수정일 */
    private String mbDelYn;         /* 삭제여부 */

    private List<AttachVO> attaches;    /* 첨부파일 list */
    private int[] delAtchNos;           /* 삭제확인 */

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
                ", attaches=" + attaches +
                ", delAtchNos=" + Arrays.toString(delAtchNos) +
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

    public List<AttachVO> getAttaches() {
        return attaches;
    }

    public void setAttaches(List<AttachVO> attaches) {
        this.attaches = attaches;
    }

    public int[] getDelAtchNos() {
        return delAtchNos;
    }

    public void setDelAtchNos(int[] delAtchNos) {
        this.delAtchNos = delAtchNos;
    }
}
