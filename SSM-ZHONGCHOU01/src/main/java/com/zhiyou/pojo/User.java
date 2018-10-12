package com.zhiyou.pojo;

public class User {
	private int id;
	private String name;
	private String telnumber;
	private String password;
	private String image;
	private String idimage;
	public String getIdimage() {
		return idimage;
	}
	public void setIdimage(String idimage) {
		this.idimage = idimage;
	}
	public String getIdimageback() {
		return idimageback;
	}
	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", telnumber=" + telnumber + ", password=" + password + ", image="
				+ image + ", idimage=" + idimage + ", idimageback=" + idimageback + ", province=" + province + ", city="
				+ city + ", email=" + email + ", faqi=" + faqi + ", canyu=" + canyu + ", money=" + money + ", idnumber="
				+ idnumber + ", state=" + state + ", content=" + content + "]";
	}
	public void setIdimageback(String idimageback) {
		this.idimageback = idimageback;
	}
	private String idimageback;
	private String province;
	private String city;
	private String email;
	private int faqi;
	private int canyu;
	private int money;
	private String idnumber;
	private String state;
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getIdnumber() {
		return idnumber;
	}
	public void setIdnumber(String idnumber) {
		this.idnumber = idnumber;
	}
	public int getFaqi() {
		return faqi;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public void setFaqi(int faqi) {
		this.faqi = faqi;
	}
	public int getCanyu() {
		return canyu;
	}
	public void setCanyu(int canyu) {
		this.canyu = canyu;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTelnumber() {
		return telnumber;
	}
	public void setTelnumber(String telnumber) {
		this.telnumber = telnumber;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getProvince() {
		return province;
	}
	public void setProvince(String province) {
		this.province = province;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	private String content;
}