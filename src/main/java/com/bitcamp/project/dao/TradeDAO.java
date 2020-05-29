package com.bitcamp.project.dao;

import java.util.Map;

import com.bitcamp.project.vo.StockVO;

public interface TradeDAO {
	public String stockSearch(String stockName);

	public void callPrice();

	public void stockBuying(StockVO vo);

	public void stockSelling();

	public void stockCorrection();

	public void stockCancel();

	public Map dayChart(String stockName);

	public Map minuteChart(String stockName);

	public void clearChart();

	public int getMoney(String id);
}
