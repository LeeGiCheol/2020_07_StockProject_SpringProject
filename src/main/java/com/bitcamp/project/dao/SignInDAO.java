package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface SignInDAO {
	public UserVO logIn();
	public void logOut();
	public void findId();
	public void findPw();
}
