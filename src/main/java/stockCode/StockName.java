package stockCode;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.Iterator;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class StockName {

	public static void main(String[] args) throws InterruptedException {

		try {

			long beforeTime = System.currentTimeMillis();
				
			OutputStream output = new FileOutputStream("C:\\Users\\Wonhee\\spring-workspace\\StockProject/stock.txt");

			for (int i = 1; i <= 32; i++) {
				String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
						doc = Jsoup.connect(url).get();
				Elements element = doc.select("table.type_2");
					Iterator<Element> ie1 = element.select("td").iterator();
					while (ie1.hasNext()) {
					byte[] by=(ie1.next().text()+"ㅇ").getBytes();
					output.write(by);
				}
				
//			long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
//			long secDiffTime = (afterTime - beforeTime)/1000; //두 시간에 차 계산
//			System.out.println("시간차이(m) : "+secDiffTime);
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}