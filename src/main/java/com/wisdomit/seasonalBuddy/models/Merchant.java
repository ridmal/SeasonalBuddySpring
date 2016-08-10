package com.wisdomit.seasonalBuddy.models;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

@Entity
@Table(name="merchant")
public class Merchant {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int merchantid;
	
	private String company;
	@NotNull
	private String muname;
	@NotNull
	private String mpass;
	
	@OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "user_id")
	private User user;
	
	@OneToMany(mappedBy = "merchants", cascade = CascadeType.ALL)
	private List<Advertisement> adds;
	
	

	public List<Advertisement> getAdds() {
		return adds;
	}

	public void setAdds(List<Advertisement> adds) {
		this.adds = adds;
	}

	public int getMerchantid() {
		return merchantid;
	}

	public void setMerchantid(int merchantid) {
		this.merchantid = merchantid;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getMuname() {
		return muname;
	}

	public void setMuname(String muname) {
		this.muname = muname;
	}

	public String getMpass() {
		return mpass;
	}

	public void setMpass(String mpass) {
		this.mpass = mpass;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}


	
}
