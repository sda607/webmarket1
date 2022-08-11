<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<meta charset="UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
</head>
<body>
   <%-- <%@ include file="./menu.jsp" %> --%>
   <jsp:include page="./menu.jsp"/>
	
   <!-- <h1>웹 쇼핑몰에 오신 것을 환영합니다.</h1> -->
   <!-- <h3>Welcome to Web Market !</h3> -->
   
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3">상품 목록</h1>
      </div>
   </div>

   <div class="container">
         <div class="row" align="center">
         <%
         String id = request.getParameter("id");
         //dao 상세 보기 메소드 호출
         ProductRepository productDAO = ProductRepository.getInstance();
         Product product = productDAO.getProductById(id);

         %>
         <div class="col-md-4">
      <img src="./upload/<%=product.getProductImage() %>" style="width:100%">
         <h3><%=product.getPname() %></h3>
         <p><%=product.getDescription() %>         
         <p><%=product.getUnitPrice() %>
         <p><a href="./product.jsp?id=<%=product.getProductId() %>" class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
      </div>         
      </div>
   </div>
</body>
<%-- <%@ include file="./footer.jsp" %> --%>
<jsp:include page="./footer.jsp"/>
</html>