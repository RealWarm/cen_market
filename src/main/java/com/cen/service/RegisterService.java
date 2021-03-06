package com.cen.service;

import com.cen.domain.MemberVO;
import com.cen.model.ReplyDTO;


public interface RegisterService {
	
	// 회원등록
	public void register(MemberVO vo) throws Exception;
	
	// 기관 이름으로 기관 번호를 찾는다.
	public int find_OrgCode(String org_name) throws Exception;

	// 기관 번호로 기관 주소를 찾는다.
	public String find_OrgAddress(int org_code) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(String user_id) throws Exception;
	
	// 닉네임 중복체크
	public int nickCheck(String nick_id) throws Exception;

	// 이메일 체크
	public int emailCheck(String user_email) throws Exception;
	
	// 댓글을 등록한다.
	public void registReply(ReplyDTO dto) throws Exception;
	
	// 북마크를 등록한다.
	public void bookMark(String sb_num, String sb_writer) throws Exception;
	
	// 북마크를 취소한다.
	public void deleteBookMark(String sb_num, String sb_writer) throws Exception;
	
	// 북마크를 등록한다.
	public int getbookCnt(String sb_num, String sb_writer) throws Exception;
	
}//end interface
