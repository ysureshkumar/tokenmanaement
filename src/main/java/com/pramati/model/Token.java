package com.pramati.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "token")
public class Token {
	@Id
	@Column(name = "tokenId")
	 
	private Integer tokenId;
	private Integer customerId;
	private Integer counter;
	private String services;
	private String status;
	public Token() {
		
	}
	
	public Token(Integer tokenId, Integer customerId, Integer counter, String services, String status) {
		super();
		this.tokenId = tokenId;
		this.customerId = customerId;
		this.counter = counter;
		this.services = services;
		this.status = status;
	}

	public Token(WaitingToken wt) {
		this.tokenId = wt.getTokenId();
		this.customerId = wt.getCustomerId();
		this.services = wt.getServices();
		this.counter = wt.getCounter();
		this.status = wt.getStatus();
	}
	
	public Integer getTokenId() {
		return tokenId;
	}
	public void setTokenId(Integer tokenId) {
		this.tokenId = tokenId;
	}
	public Integer getCustomerId() {
		return customerId;
	}
	public void setCustomerId(Integer customerId) {
		this.customerId = customerId;
	}
	public Integer getCounter() {
		return counter;
	}
	public void setCounter(Integer counter) {
		this.counter = counter;
	}
	public String getServices() {
		return services;
	}
	public void setServices(String services) {
		this.services = services;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String toString() {
		return tokenId+"-"+customerId+"-"+counter+"-"+services+"-"+status;
	}
}
