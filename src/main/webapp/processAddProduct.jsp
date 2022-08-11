<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@	page import="vo.Product"%>
<%@	page import="dao.ProductRepository"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	//파일의 경로
	String realFolder = "C:/Dev/jspworks/WebMarket1/src/main/webapp/upload/";
	int maxSize = 5 * 1024 * 1024;	//최대용량
	String encType = "utf-8";
	
	//파라미터 - 5개
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy()); // request, 경로, 용량, 타입유형, 정책클래스

	//multi로 폼 입력값 받기
	String productId = multi.getParameter("productId");
	String pname = multi.getParameter("pname");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition"); 
	

	//폼 입력값 받아오기
	/* String productId = request.getParameter("productId");
	String pname = request.getParameter("pname");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition"); */
	//String filename = request.getParameter("filename"); 

	//숫자 자료형 변환
	int price;
	if(unitPrice.isEmpty()){
		price = 0;
	}else{
		price = Integer.valueOf(unitPrice);		//정수형으로 변환
	}
	
	long stock;
	if(unitsInStock.isEmpty()){
		stock = 0;
	}else{
		stock = Long.valueOf(unitsInStock);		//long형으로 변환
	}
	
	//이미지 파일 ㄱ ㅏ져오기
	Enumeration<?> files = multi.getFileNames();//파일 가져오기 반복
	String fname = (String)files.nextElement();	//파일 있음
	String productImage = multi.getFilesystemName(fname); //이미지 파일
	
	
	
	//dao 상품 추가
	ProductRepository dao =  ProductRepository.getInstance();
	Product product = new Product();
	
	product.setProductId(productId);
	product.setPname(pname);
	product.setUnitPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);
	product.setProductImage(productImage);
	
	dao.addProduct(product);
	
	//페이지 이동
	response.sendRedirect("./products.jsp");
	
	
	
	
	
	
	
	
	
%>