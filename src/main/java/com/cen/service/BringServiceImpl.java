package com.cen.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cen.domain.MainVO;
import com.cen.persistence.BringDAO;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Repository
public class BringServiceImpl implements BringService{
	
	@Inject
	BringDAO dao;

	@Override
	public List<MainVO> mainListAll() throws Exception {		
		return dao.mainListAll();
	}//mainListAll

}//end class