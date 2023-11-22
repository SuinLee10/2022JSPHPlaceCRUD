package com.example.bean;

import java.util.Date;

public class HPlaceVO {
	private int seq;
	private String title;
	private String PlaceName;
	private String Address;
	private String Mobile;
	private String RunTime;
	private String DayOff;
	private String PlaceType;
	private int Star;
	private Date regdate;
	private String content;

	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPlaceName(){ return PlaceName; }
	public void setPlaceName(String PlaceName){this.PlaceName = PlaceName;}
	public String getAddress(){ return Address; }
	public void setAddress(String Address){this.Address = Address;}
	public String getMobile(){ return Mobile; }
	public void setMobile(String Mobile){this.Mobile = Mobile;}
	public String getRunTime(){ return RunTime; }
	public void setRunTime(String RunTime){this.RunTime = RunTime;}
	public String getDayOff(){ return DayOff; }
	public void setDayOff(String DayOff){this.DayOff = DayOff;}

	public String getPlaceType(){ return PlaceType; }
	public void setPlaceType(String PlaceType){this.PlaceType = PlaceType;}
	public int getStar() {
		return Star;
	}
	public void setStar(int Star) {
		this.Star = Star;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
