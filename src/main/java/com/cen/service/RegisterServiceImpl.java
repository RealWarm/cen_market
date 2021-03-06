package com.cen.service;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.cen.domain.MemberVO;
import com.cen.model.ReplyDTO;
import com.cen.persistence.RegisterDAO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Repository
public class RegisterServiceImpl implements RegisterService {
	
	@Inject
	RegisterDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		log.info("RegisterServiceImpl:: public void register(MemberVO vo) invoked!!!");
		dao.register(vo);
	}//register

	@Override
	public int find_OrgCode(String org_name) throws Exception {
		log.info("RegisterServiceImpl:: public int find_OrgCode(String org_name) invoked!!!");
		int code=dao.find_OrgCode(org_name);		
		return code;
	}//find_OrgCode

	@Override
	public String find_OrgAddress(int org_code) throws Exception {
		log.info("RegisterServiceImpl:: public String find_OrgAddress(int org_code) invoked!!!");
		String recent=dao.find_OrgAddress(org_code);
		return recent;
	}//find_OrgAddress

	@Override
	public int idCheck(String user_id) throws Exception {
		log.info("RegisterServiceImpl:: idCheck() invoked!!!");
		return dao.idCheck(user_id);
	}//idCheck

	@Override
	public int nickCheck(String nick_id) throws Exception {
		log.info("RegisterServiceImpl:: nickCheck() invoked!!!");
		return dao.nickCheck(nick_id);
	}//nickCheck

	@Override
	public int emailCheck(String user_email) throws Exception {
		log.info("RegisterServiceImpl:: emailCheck() invoked!!!");
		return dao.emailCheck(user_email);
	}//emailCheck

	@Override
	public void registReply(ReplyDTO dto) throws Exception {
		log.info("RegisterServiceImpl:: emailCheck() invoked!!!");
		dao.registReply(dto);
	}//registReply

	@Override
	public void bookMark(String sb_num, String sb_writer) throws Exception {
		log.info("RegisterServiceImpl:: bookMark() invoked!!!");		
		dao.bookMark(sb_num, sb_writer);
	}//bookMark

	@Override
	public void deleteBookMark(String sb_num, String sb_writer) throws Exception {
		log.info("RegisterServiceImpl:: deleteBookMark() invoked!!!");
		dao.deleteBookMark(sb_num, sb_writer);
	}//deleteBookMark

	@Override
	public int getbookCnt(String sb_num, String sb_writer) throws Exception {
		log.info("RegisterServiceImpl:: getbookCnt() invoked!!!");
		return dao.getbookCnt(sb_num, sb_writer);
	}//getbookCnt
	

}//end class
