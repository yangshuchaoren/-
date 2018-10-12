package com.zhiyou.pojo;

import java.util.Date;

public class Trade {
  private int id;
  private int uid;
  private int pid;
  private int money;
  private Date date;
  private String details;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getUid() {
	return uid;
}
public void setUid(int uid) {
	this.uid = uid;
}
public int getPid() {
	return pid;
}
public void setPid(int pid) {
	this.pid = pid;
}
public int getMoney() {
	return money;
}
public void setMoney(int money) {
	this.money = money;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public String getDetails() {
	return details;
}
public void setDetails(String details) {
	this.details = details;
}
}
