package com.cen.controller;

import java.util.List;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cen.domain.MainVO;
import com.cen.domain.SboardVO;
import com.cen.domain.ViewVO;
import com.cen.persistence.BringDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class BringDAOTest {
	
	@Inject
	BringDAO dao;
	
	@Test
	public void testMainAll() throws Exception {
		log.info("BringDAOTest::testMainAll invoked!!");
		List<MainVO> list=dao.mainListAll();
		
		for(MainVO vv : list) {
			log.info("게시글번호 : "+ vv.getSb_num());
			log.info("게시글제목 : "+ vv.getSb_name());
			log.info("게시글상세 : "+ vv.getSb_detail());
			log.info("게시글사진 : "+ vv.getSb_view());
			log.info("=====================================");
		}//for-vv
		
	}//test
	
	
	@Test
	public void testSdetail() throws Exception {
		log.info("BringDAOTest::testSdetail invoked!!");
		SboardVO vv = dao.detail(1);
		System.out.println(vv);		
	}//test
	
	@Test
	public void testViewAll() throws Exception{
		log.info("BringDAOTest::testViewAll() invoked!!");
		List<ViewVO> list=dao.viewAll(3);
		
		for(ViewVO vv:list) {
			System.out.println("==============");
			System.out.println(vv);
			System.out.println("==============");
		}//enhanced-for
		
	}//test
	
	

}//endclass
