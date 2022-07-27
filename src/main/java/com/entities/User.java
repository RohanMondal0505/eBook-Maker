package com.entities;


import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class User {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private int userId;
	@Column(name = "user_name")
	private String userName;
	@Column(name = "user_id_string", unique = true)
	private String userIdString;
	@Column(name = "user_type")
	private String userType;
	@Column(length = 100, name = "user_password")
	private String userPaswored;
	@Column(name = "user_email")
	private String userEmail;
	@Column(name = "user_number")
	private String userNumber;
	@Column(length = 1500, name = "user_address")
	private String userAddress;
	@Column(name = "user_approve")
	private boolean userApprove;

	public User(int userId, String userName, String userIdString, String userType, String userPaswored,
			String userEmail, String userNumber, String userAddress, boolean userApprove) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userIdString = userIdString;
		this.userType = userType;
		this.userPaswored = userPaswored;
		this.userEmail = userEmail;
		this.userNumber = userNumber;
		this.userAddress = userAddress;
		this.userApprove = userApprove;
	}

	public User(String userName, String userIdString, String userType, String userPaswored, String userEmail,
			String userNumber, String userAddress, boolean userApprove) {
		super();
		this.userName = userName;
		this.userIdString = userIdString;
		this.userType = userType;
		this.userPaswored = userPaswored;
		this.userEmail = userEmail;
		this.userNumber = userNumber;
		this.userAddress = userAddress;
		this.userApprove = userApprove;
	}
	
	

	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserIdString() {
		return userIdString;
	}

	public void setUserIdString(String userIdString) {
		this.userIdString = userIdString;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getUserPaswored() {
		return userPaswored;
	}

	public void setUserPaswored(String userPaswored) {
		this.userPaswored = userPaswored;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(String userNumber) {
		this.userNumber = userNumber;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public boolean isUserApprove() {
		return userApprove;
	}

	public void setUserApprove(boolean userApprove) {
		this.userApprove = userApprove;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userName=" + userName + ", userIdString=" + userIdString + ", userType="
				+ userType + ", userPaswored=" + userPaswored + ", userEmail=" + userEmail + ", userNumber="
				+ userNumber + ", userAddress=" + userAddress + ", userApprove=" + userApprove + "]";
	}

}
