package com.zhiyou.pojo;
import java.util.Date;
public class PingLun {
  private int id;
  private User user;
  private String content;
  private Project project;
  private Date date;
public User getUser() {
	return user;
}
@Override
public String toString() {
	return "PingLun [id=" + id + ", user=" + user + ", content=" + content + ", project=" + project + ", date=" + date
			+ "]";
}
public void setUser(User user) {
	this.user = user;
}
public Project getProject() {
	return project;
}
public void setProject(Project project) {
	this.project = project;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
}
