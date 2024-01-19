package com.study.member.vo;

public class MemberVO {
    private String mmId;
    private String mmPassword;
    private String mmEmail;
    private String mmName;
    private String mmPhone;
    private String mmAdd;
    private String mmDetailAdd;
    private String mmRegDate;
    private String mmDelYn;

    @Override
    public String toString() {
        return "MemberVO{" +
                "mmId='" + mmId + '\'' +
                ", mmPassword='" + mmPassword + '\'' +
                ", mmEmail='" + mmEmail + '\'' +
                ", mmName='" + mmName + '\'' +
                ", mmPhone='" + mmPhone + '\'' +
                ", mmAdd='" + mmAdd + '\'' +
                ", mmDetailAdd='" + mmDetailAdd + '\'' +
                ", mmRegDate='" + mmRegDate + '\'' +
                ", mmDelYn='" + mmDelYn + '\'' +
                '}';
    }

    public String getMmId() {
        return mmId;
    }

    public void setMmId(String mmId) {
        this.mmId = mmId;
    }

    public String getMmPassword() {
        return mmPassword;
    }

    public void setMmPassword(String mmPassword) {
        this.mmPassword = mmPassword;
    }

    public String getMmEmail() {
        return mmEmail;
    }

    public void setMmEmail(String mmEmail) {
        this.mmEmail = mmEmail;
    }

    public String getMmName() {
        return mmName;
    }

    public void setMmName(String mmName) {
        this.mmName = mmName;
    }

    public String getMmPhone() {
        return mmPhone;
    }

    public void setMmPhone(String mmPhone) {
        this.mmPhone = mmPhone;
    }

    public String getMmAdd() {
        return mmAdd;
    }

    public void setMmAdd(String mmAdd) {
        this.mmAdd = mmAdd;
    }

    public String getMmDetailAdd() {
        return mmDetailAdd;
    }

    public void setMmDetailAdd(String mmDetailAdd) {
        this.mmDetailAdd = mmDetailAdd;
    }

    public String getMmRegDate() {
        return mmRegDate;
    }

    public void setMmRegDate(String mmRegDate) {
        this.mmRegDate = mmRegDate;
    }

    public String getMmDelYn() {
        return mmDelYn;
    }

    public void setMmDelYn(String mmDelYn) {
        this.mmDelYn = mmDelYn;
    }
}
