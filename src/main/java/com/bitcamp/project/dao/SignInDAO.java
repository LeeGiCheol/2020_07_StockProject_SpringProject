package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface SignInDAO {
	public UserVO logIn(UserVO vo);
	public void logOut();
	public UserVO findId(UserVO vo);
	public void tryId();
	public UserVO findPw(UserVO vo);
}
