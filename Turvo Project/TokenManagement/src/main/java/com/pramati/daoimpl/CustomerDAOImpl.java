package com.pramati.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.pramati.dao.CustomerDAO;
import com.pramati.model.Customer;

public class CustomerDAOImpl implements CustomerDAO {

	
	private HibernateTemplate ht;
	
	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	@Transactional
	public int save(Customer c) {
		// TODO Auto-generated method stub
		int count = (Integer)	ht.save(c);
//		ht.flush();
		return count;
	}
	@Transactional
	public boolean update(Customer o) {
		// TODO Auto-generated method stub
		 ht.update(o);
		 return true;
	}

	public Integer maxId() {
		HibernateCallback hbcallback =  new HibernateCallback() {
			Integer max =null;
			public Object doInHibernate(Session session) throws HibernateException {
			
				Query query = session.createQuery("select max(id)+1 from com.pramati.model.Customer");
				List<Integer> l = query.list();
				max = l.get(0);
				System.out.println("current max:"+max);
				return max;
			}			
		}; 
		 
		return (Integer) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
	}
	
	public Customer getCustomerDetails(Integer id) {
		Customer cust = (Customer) ht.get(Customer.class, id);
		return cust;
	}

}
