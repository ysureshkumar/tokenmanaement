package com.pramati.daoimpl;

import java.util.ArrayList;
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
import com.pramati.dao.UsersDAO;
import com.pramati.dao.TokenDAO;
import com.pramati.model.Token;

public class UsersDAOImpl implements UsersDAO {

	private HibernateTemplate ht;

	public HibernateTemplate getHt() {
		return ht;
	}

	public void setHt(HibernateTemplate ht) {
		this.ht = ht;
	}

	public String getRole(final String username, final String password) {
		HibernateCallback hbcallback = new HibernateCallback() {
			String role = null;

			public Object doInHibernate(Session session) throws HibernateException {

				Query query = session.createQuery("select role from com.pramati.model.Users u where u.username ='"
						+ username + "' and password='" + password + "'");
				List<String> l = query.list();
				//System.out.println("List: "+l);
				if (l.size() > 0) {
					role = l.get(0);
				} else {
					role = "x";
				}
				System.out.println("Role:" + role);
				return role;
			}
		};

		return (String) hbcallback.doInHibernate(ht.getSessionFactory().openSession());
	}
}