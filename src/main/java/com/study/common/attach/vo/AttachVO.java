package com.study.common.attach.vo;

public class AttachVO {

    private int atchNo;                     /* 첨부파일 번호 */
    private int atchParentNo;               /* 부모 글번호(부모의 PK) */
    private String atchFileName;            /* 실제 저장된 파일명 */
    private String atchOriginalName;        /* 사용자가 올리 원래 파일명*/
    private long atchFileSize;               /* 파일 사이즈 */
    private String atchFancySize;           /* 팬시 사이즈 */
    private String atchContentType;         /* 컨텐츠 타입 */
    private String atchPath;                /* 저장 경로 */
    private String atchDelYn;               /* 삭제 여부 */
    private String atchRegDate;             /* 등록일 */

    @Override
    public String toString() {
        return "AttachVO{" +
                "atchNo=" + atchNo +
                ", atchParentNo=" + atchParentNo +
                ", atchFileName='" + atchFileName + '\'' +
                ", atchOriginalName='" + atchOriginalName + '\'' +
                ", atchFileSize=" + atchFileSize +
                ", atchFancySize='" + atchFancySize + '\'' +
                ", atchContentType='" + atchContentType + '\'' +
                ", atchPath='" + atchPath + '\'' +
                ", atchDelYn='" + atchDelYn + '\'' +
                ", atchRegDate='" + atchRegDate + '\'' +
                '}';
    }

    public int getAtchNo() {
        return atchNo;
    }

    public void setAtchNo(int atchNo) {
        this.atchNo = atchNo;
    }

    public int getAtchParentNo() {
        return atchParentNo;
    }

    public void setAtchParentNo(int atchParentNo) {
        this.atchParentNo = atchParentNo;
    }

    public String getAtchFileName() {
        return atchFileName;
    }

    public void setAtchFileName(String atchFileName) {
        this.atchFileName = atchFileName;
    }

    public String getAtchOriginalName() {
        return atchOriginalName;
    }

    public void setAtchOriginalName(String atchOriginalName) {
        this.atchOriginalName = atchOriginalName;
    }

    public long getAtchFileSize() {
        return atchFileSize;
    }

    public void setAtchFileSize(long atchFileSize) {
        this.atchFileSize = atchFileSize;
    }

    public String getAtchFancySize() {
        return atchFancySize;
    }

    public void setAtchFancySize(String atchFancySize) {
        this.atchFancySize = atchFancySize;
    }

    public String getAtchContentType() {
        return atchContentType;
    }

    public void setAtchContentType(String atchContentType) {
        this.atchContentType = atchContentType;
    }

    public String getAtchPath() {
        return atchPath;
    }

    public void setAtchPath(String atchPath) {
        this.atchPath = atchPath;
    }

    public String getAtchDelYn() {
        return atchDelYn;
    }

    public void setAtchDelYn(String atchDelYn) {
        this.atchDelYn = atchDelYn;
    }

    public String getAtchRegDate() {
        return atchRegDate;
    }

    public void setAtchRegDate(String atchRegDate) {
        this.atchRegDate = atchRegDate;
    }
}
