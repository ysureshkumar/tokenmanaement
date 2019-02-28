package com.pramati.dao;

import com.pramati.model.Token;

public interface TokenDAO {
public int save(Token t);
public boolean update(Token t);
public Integer maxId();
public Token getTokenDetails(Integer id);
}
