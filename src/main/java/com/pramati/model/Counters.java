package com.pramati.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "counters")
public class Counters {
	@Id
	@Column(name = "counterId")
	 
	private Integer counterId;
	private String services;
	private String counterType;
	public Integer getCounterId() {
		return counterId;
	}
	public void setCounterId(Integer counterId) {
		this.counterId = counterId;
	}
	public String getServices() {
		return services;
	}
	public void setServices(String services) {
		this.services = services;
	}
	public String getCounterType() {
		return counterType;
	}
	public void setCounterType(String counterType) {
		this.counterType = counterType;
	}
}
