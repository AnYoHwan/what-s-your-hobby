package com.mycompany.vo;

import java.util.Date;

public class ReplyVO {

	private int coseq;
	private int crseq;
	private String content;
	private String writer;
	private Date regdate;

	public int getCoseq() {
		return coseq;
	}
	public void setCoseq(int coseq) {
		this.coseq = coseq;
	}
	public int getCrseq() {
		return crseq;
	}
	public void setCrseq(int crseq) {
		this.crseq = crseq;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ReplyVO [coseq=" + coseq + ", crseq=" + crseq + ", content=" + content + ", writer=" + writer + ", regdate="
				+ regdate + "]";
	}
	
	
}

