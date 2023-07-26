package com.roadscanner.domain;

//VO(Value Object)
public class MemberVO {
	private String uid; // 회원 아이디
	private String upassword; // 회원 비밀번호
	private String uemail; // 회원 이메일
	private int ugrade;// 회원 등급
	
	public MemberVO() {	}
	
	public MemberVO(String uid, String upassword) {
		super();
		this.uid = uid;
		this.upassword = upassword;
	
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getUemail() {
		return uemail;
	}
	public void setUemail(String uemail) {
		this.uemail = uemail;
	}
	public int getUgrade() {
		return ugrade;
	}
	public void setUgrade(int ugrade) {
		this.ugrade = ugrade;
	}
	@Override
	public String toString() {
		return "MemberVO [uid=" + uid + ", upassword=" + upassword + ", uemail=" + uemail + ", ugrade=" + ugrade + "]";
	}
	
	
	
}