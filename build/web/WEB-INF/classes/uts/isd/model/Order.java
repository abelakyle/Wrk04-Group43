/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.isd.model;

import java.io.Serializable;

public class Order implements Serializable {
	private String ID;
	private String qty;
	private String created;
	private String address;
	private String city;
	private String state;
	private String postcode;
	private String eta;
	private String price;
	private String status;

	public Order(String ID, String qty, String created, String address, String city, String state, String postcode, String eta, String price, String status) {
		this.ID = ID;
		this.qty = qty;
		this.created = created;
		this.address = address;
		this.city = city;
		this.state = state;
		this.postcode = postcode;
		this.eta = eta;
		this.price = price;
		this.status = status;
	}
	
	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getQty() {
		return qty;
	}

	public void setQty(String qty) {
		this.qty = qty;
	}

	public String getCreated() {
		return created;
	}

	public void setCreated(String created) {
		this.created = created;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPostcode() {
		return postcode;
	}

	public void setPostcode(String postcode) {
		this.postcode = postcode;
	}

	public String getEta() {
		return eta;
	}

	public void setEta(String eta) {
		this.eta = eta;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String price) {
		this.status = status;
	}

	
}
