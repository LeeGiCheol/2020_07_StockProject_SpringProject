package com.bitcamp.project.dao;

import java.util.List;

import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.UserVO;

public interface MyPostDAO {
	public void myListSearch();
	public void myCommentList();
	public List<BoardVO> myPostList(UserVO loginUser);
	public void myListDelete();
	
}
