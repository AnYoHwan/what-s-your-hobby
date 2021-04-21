package com.mycompany.vo;

public class MemberVO {
	
	private int mseq;
	private String id;
	private String nick;
	private String pw;
	private String email;
	private String gender;
	private String age;

	public int getMseq() {
		return mseq;
	}

	public void setMseq(int mseq) {
		this.mseq = mseq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNick() {
		return nick;
	}

	public void setNick(String nick) {
		this.nick = nick;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}


	@Override
	public String toString() {
		return "MemberVO [mseq=" + mseq + ", id=" + id + ", nick=" + nick + ", pw="	+ pw + ", email=" + email + ", gender=" + gender + ", age=" + age + "]";
	}
	
}