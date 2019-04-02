package com.pramati.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateCallback;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.pramati.dao.CountersDAO;
import com.pramati.dao.TokenDAO;
import com.pramati.dao.TokenDAO;
import com.pramati.model.Token;

public class CounterDAOImpl implements CountersDAO {

	
	private HibernateTemplate ht;
	
	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	/*
	 * @Transactional public int save(Token t) { // TODO Auto-generated method stub
	 * int count = (Integer) ht.save(t); return count; }
	 * 
	 * @Transactional public boolean update(Token t) { // TODO Auto-generated method
	 * stub ht.update(t); return true; }
	 */
	public Integer maxId() {
		HibernateCallback hbcallback =  new HibernateCallback() {
			Integer max =null;
			public Object doInHibernate(Session session) throws HibernateException {
			
				Query query = session.createQuery("select max(id)+1 from com.pramati.model.Token");
				List<Integer> l = query.list();
				max = l.get(0);
				System.out.println("current max:"+max);
				return max;
			}			
		}; 
		 
		return (Integer) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
	}
	
public String getCounterType(Integer counterId) {
	// TODO Auto-generated method stub
	return null;
}
public String  getServices(Integer counterId) {
	HibernateCallback hbcallback =  new HibernateCallback() {
		String service =null;
		public Object doInHibernate(Session session) throws HibernateException {
		
			Query query = session.createQuery("select services from com.pramati.model.Counters");
			List<Integer> l = query.list();
			max = l.get(0);
			System.out.println("current max:"+max);
			return max;
		}			
	}; 
	 
	return (Integer) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
}
}
