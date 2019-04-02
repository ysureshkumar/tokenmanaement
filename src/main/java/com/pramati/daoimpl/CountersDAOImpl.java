package com.pramati.daoimpl;

import java.util.ArrayList;
import java.util.Iterator;
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

public class CountersDAOImpl implements CountersDAO {

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
	/*
	 * public Integer maxId() { HibernateCallback hbcallback = new
	 * HibernateCallback() { Integer max =null; public Object doInHibernate(Session
	 * session) throws HibernateException {
	 * 
	 * Query query =
	 * session.createQuery("select max(id)+1 from com.pramati.model.Token");
	 * List<Integer> l = query.list(); max = l.get(0); return max; } };
	 * 
	 * return (Integer)
	 * hbcallback.doInHibernate(ht.getSessionFactory().openSession()); }
	 */

	public String getCounterType(final Integer counterId) {
		HibernateCallback hbcallback = new HibernateCallback() {
			String counterType = null;

			public Object doInHibernate(Session session) throws HibernateException {

				Query query = session.createQuery(
						"select counterType from com.pramati.model.Counters c where c.counterId =" + counterId);
				List<String> l = query.list();
				counterType = l.get(0);
				System.out.println("counterType:" + counterType);
				return counterType;
			}
		};

		return (String) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
	}

	public String getServices(final Integer counterId) {
		HibernateCallback hbcallback = new HibernateCallback() {

			String services = null;

			public Object doInHibernate(Session session) throws HibernateException {

				Query query = session.createQuery("select services from com.pramati.model.Counters where counterId =" + counterId);

				List l = query.list();
				System.out.println("hello:" + l.get(0));

				if (l != null) {
					services =(String) l.get(0);
				} 
						
				System.out.println("services:" + services);
				return services;
			}
		};

		return (String) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
	}
public List<Integer> getCounters(final String service) {
	HibernateCallback hbcallback = new HibernateCallback() {

		List<Integer> countersList = new ArrayList<Integer>();

		public Object doInHibernate(Session session) throws HibernateException {

			Query query = session.createQuery("select counterId from com.pramati.model.Counters where services like '%"+service+"%' and counterType!='prime'" );

			List l = query.list();

			if (l != null) {
				countersList.addAll(l);
			} 
					
			System.out.println("countersList:" + countersList);
			return countersList;
		}
	};	
	return (List<Integer>) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
}

public List<Token> getPendingTokens() {
	HibernateCallback hbcallback = new HibernateCallback() {

		List<Token> ptokenList = new ArrayList<Token>();

		public Object doInHibernate(Session session) throws HibernateException {

			Query query = session.createQuery(" from com.pramati.model.Token t where t.status='progress'");

			List l = query.list();

			Iterator<Token> it = l.iterator();
			
			while(it.hasNext()) {
				ptokenList.add(it.next());
			} 				
			System.out.println("P Token List:" + ptokenList);
			return ptokenList;
		}
	};	
	return (List<Token>) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
}

}