package com.roadscanner.domain;

//VO(Value Object)
public class MemberVO {
	private int no;		// 사용자 번호
	private int grade;		// 회원 등급 (10-관리자, 20-일반사용자)
	private String name;	// 이름
	private String id;		// 회원id
	private String pw;		// 비밀번호
	private String tel;		// 전화번호
	private String birth;	// 생년월일
	private char sex;		// 성별
	
	private int postNum; 	// 우편번호
	private String nAddr;	// 신주소 
	private String oAddr;	// 구주소
	private String restAddr;// 상세 주소
	
	private String email;	// 이메일 
	private String regDt;	// 가입일 
	private char del;		// 회원탈퇴 여부 
	
	public MemberVO() {	}
	
	public MemberVO(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public char getSex() {
		return sex;
	}
	public void setSex(char sex) {
		this.sex = sex;
	}
	public int getPostNum() {
		return postNum;
	}
	public void setPostNum(int postNum) {
		this.postNum = postNum;
	}
	public String getnAddr() {
		return nAddr;
	}
	public void setnAddr(String nAddr) {
		this.nAddr = nAddr;
	}
	public String getoAddr() {
		return oAddr;
	}
	public void setoAddr(String oAddr) {
		this.oAddr = oAddr;
	}
	public String getRestAddr() {
		return restAddr;
	}
	public void setRestAddr(String restAddr) {
		this.restAddr = restAddr;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	public char getDel() {
		return del;
	}
	public void setDel(char del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "MemberVO [no=" + no + ", grade=" + grade + ", name=" + name + ", id=" + id + ", pw=" + pw + ", tel=" + tel
				+ ", birth=" + birth + ", sex=" + sex + ", post_num=" + postNum + ", nAddr=" + nAddr + ", oAddr="
				+ oAddr + ", restAddr=" + restAddr + ", email=" + email + ", regDt=" + regDt + ", del=" + del + "]";
	}	
}