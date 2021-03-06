package com.cen.controller;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.cen.domain.SboardVO;
import com.cen.model.SaleRegisterDTO;
import com.cen.model.ViewDTO;
import com.cen.persistence.SaleDAO;
import com.cen.service.BringService;
import com.cen.service.SaleService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations= {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SaleDAOTest {

	@Inject
	private SaleDAO saledao;
	
	@Inject
	SaleService saleservice;
	
	@Inject
	BringService bringService;
	
	@Test
	public void testGetBoardCnt() throws Exception{
		int cnt=saledao.boardCnt();
		System.out.println(cnt);
	}//testCreate
	
//	insert into tbl_sboard 
//		(sb_num, sb_writer, sb_nickname, sb_name, sb_detail, Total_price, 
//		 Total_quantity, ct_num, trade_shape, sb_view, trade_area)
//	value
//		(#{sb_num}, #{sb_writer}, #{sb_nickname}, #{sb_name}, #{sb_detail}, #{Total_price}, 
//		 #{Total_quantity}, #{ct_num}, #{trade_shape}, #{sb_view}, #{trade_area});
	
	@Test
	public void testinsertBoard() throws Exception{
		SaleRegisterDTO dto = new SaleRegisterDTO(1, "test1", "test", "사무용 책상 팝니다.",  "사무용 의자 책상팝니다. ㅇㅇㅇㅇ팝니다. ㅇㅇㅇㅇ팝니다. ㅇㅇㅇㅇ팝니다. ㅇㅇㅇㅇ",
				100000, 1, 100, "직거래", "main_banner11_1200x350.png", "신관동");
		int bd_num=saleservice.boardCnt()+1;		
		dto.setSb_num(bd_num);
		System.out.println(dto);
		saledao.insertBoard(dto);		
	}//testCreate
	
	
	@Test
	public void testinsertImage() throws Exception{
		ViewDTO dto = new ViewDTO(2222, "cat.jpg");
		saledao.insertImage(dto);
	}//testCreate
	
	@Test
	public void testgetOrgName() throws Exception{
		String org = saledao.getOrgName("qwe123");
		System.out.println("org :: " + org);
	}//testCreate
	
	@Test
	public void testgetRecentAddress() throws Exception{
		String recent_address = saledao.getRecentAddress("qwe123");
		System.out.println("recent_address :: " + recent_address);
	}//testCreate
	
	@Test
	public void testUpdateRecentAddress() throws Exception{
		saledao.updateRecentAddress("qwe123", "강남구 역삼동");
	}//test
	
	@Test
	public void testupdateSaleBorad() throws Exception{
		SboardVO vo = new SboardVO();
		vo.setSb_num(8);
		vo.setSb_name("indao");
		vo.setSb_detail("indao");
		vo.setTotal_price(78787878);
		vo.setTotal_quantity(1);
		vo.setCt_num(100);
		vo.setTrade_area("indao");
		vo.setTrade_shape("찾아갈게요");
		saledao.updateSaleBorad(vo);		
	}//test
	
	
	
	
	
}//end class












