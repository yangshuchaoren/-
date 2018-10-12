package com.zhiyou.pojo;

public class Support {

	// 将点赞的数进行封装
	private int id;

	private Project project;

	private User user;

	public int getId() {

		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	private int money;

}
