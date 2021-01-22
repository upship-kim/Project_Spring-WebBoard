package sist.com.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Component;

import sist.com.app.dto.SummerNoteBean;

@Component(value="summerNoteDao")
public class SummerNoteDao extends SqlSessionDaoSupport{

	@Inject
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		// TODO Auto-generated method stub
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	public void insertWrite(SummerNoteBean bean) {
		this.getSqlSession().insert("insertWrite", bean);
	}
	
	
}
