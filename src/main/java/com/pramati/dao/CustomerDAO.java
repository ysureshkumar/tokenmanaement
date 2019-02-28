package com.pramati.dao;

import com.pramati.model.Customer;

public interface CustomerDAO {
public int save(Customer o);
public boolean update(Customer o);
public Integer maxId();
public Customer getCustomerDetails(Integer id);
}
