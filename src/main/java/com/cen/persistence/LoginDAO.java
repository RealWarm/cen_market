package com.cen.persistence;

import com.cen.domain.MemberVO;
import com.cen.model.LoginDTO;

public interface LoginDAO {
		
		//로그인을 시도 합니다.
		public MemberVO login(LoginDTO dto) throws Exception;
		
		// 로그인을 체크합니다.
		public Integer login_chk(LoginDTO dto) throws Exception;
		
		
}//end interface
