package com.apogee.EntityModel;

import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int categoryId;
	private String title;

	// Bidirectional mapping
	@OneToMany(mappedBy = "category", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
	private Set<Product> product;

	/**
	 * @return the categoryId
	 */
	public int getCategoryId() {
		return categoryId;
	}

	/**
	 * @param categoryId the categoryId to set
	 */
	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	public Category() {
		super();
	}

	public Category(int categoryId, String title) {
		super();
		this.categoryId = categoryId;
		this.title = title;
	}

	/**
	 * @return the product
	 */
	public Set<Product> getProduct() {
		return product;
	}

//    public Set<Product> getProduct(Set<Product> product) {
//        return product;
//    }

	/**
	 * @param product the product to set
	 */
	public void setProduct(Set<Product> product) {
		this.product = product;
	}
}
