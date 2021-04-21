package com.mycompany.vo;

import java.util.Date;

public class CommunityVO {

	private int coseq;
	private String leader;
	private String category;
	private String place;
	private String intro;
	private Date regdate;
	
	public int getCoseq() {
		return coseq;
	}
	public void setCoseq(int coseq) {
		this.coseq = coseq;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
}
