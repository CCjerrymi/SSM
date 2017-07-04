package com.entity;

public class Result {
	public String resultID;
	public String questnaireID;
	public String questionID;
	public String userIP;
	public String submitTime;
	public String resultA;
	public String resultB;
	public String resultC;
	public String resultD;
	public String getResultID() {
		return resultID;
	}
	public void setResultID(String resultID) {
		this.resultID = resultID;
	}
	public String getQuestnaireID() {
		return questnaireID;
	}
	public void setQuestnaireID(String questnaireID) {
		this.questnaireID = questnaireID;
	}
	public String getQuestionID() {
		return questionID;
	}
	public void setQuestionID(String questionID) {
		this.questionID = questionID;
	}
	
	public String getResultA() {
		return resultA;
	}
	public void setResultA(String resultA) {
		this.resultA = resultA;
	}
	public String getResultB() {
		return resultB;
	}
	public void setResultB(String resultB) {
		this.resultB = resultB;
	}
	public String getResultC() {
		return resultC;
	}
	public void setResultC(String resultC) {
		this.resultC = resultC;
	}
	public String getResultD() {
		return resultD;
	}
	public void setResultD(String resultD) {
		this.resultD = resultD;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	@Override
	public String toString() {
		return "Result [resultID=" + resultID + ", questnaireID="
				+ questnaireID + ", questionID=" + questionID
				+ ",  userIP=" + userIP
				+ ", submitTime=" + submitTime + "]";
	}
	
	
}
