package com.cen.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.cen.domain.MainVO;
import com.cen.domain.SboardVO;
import com.cen.domain.ViewVO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository
public class BringDAOImpl implements BringDAO{

	@Inject
	private SqlSession session;
	
	private static final String namespace="com.cen.mapper.BringMapper";
			
	@Override
	public List<MainVO> mainListAll() throws Exception {	
		log.info("BringDAOImpl:: mainListAll() invoked!!!");
		return session.selectList(namespace+".mainListAll");
	}//mainListAll

	@Override
	public SboardVO detail(Integer num) throws Exception {
		log.info("BringDAOImpl:: detail(Integer num) invoked!!!");
		return session.selectOne(namespace + ".sdetail", num);
	}//detail
	
	@Override
	public String topPicture(Integer num) throws Exception {
		log.info("BringDAOImpl:: topPicture(Integer num) invoked!!!");
		return session.selectOne(namespace + ".bringTop", num);
	}//topPicture

	@Override
	public List<ViewVO> viewAll(Integer num) throws Exception {		
		log.info("BringDAOImpl:: viewAll(Integer num) invoked!!!");
		return session.selectList(namespace+".bringViewAll", num);
	}//viewAll

	
}//endclass
