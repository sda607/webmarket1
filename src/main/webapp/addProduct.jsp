<%@page import="vo.Product"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.ProductRepository"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome!</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
<!-- <script src="./resources/vailidation.js"></script> -->
 <script>
 	function checkAddProduct(){
		//id 선택자를 사용해서 유형성 검사
		let productId = document.getElementById("productId");
		let pname = document.getElementById("pname");
		let unitPrice = document.getElementById("unitPrice");
		let unitsInStock = document.getElementById("unitsInStock");
		
		//정규표현식
		let regExpId = /^P[0-9]{4,11}$/
		
		
		//상품 아이디 체크 - P와 숫자를 조합하여 5~12자까지 입력
		if(!regExpId.test(productId.value)){
			alert("[상품 코드]\n P와 숫자를 조합하여 5~12자까지 입력")
			productId.slect();
			productId.focus();
			return false;
		}
		
		//상품명 체크 - 최소 4자에서 12자까지 입력

		if(pname.value.length < 4 || pname.value.length > 12){
			alert("최소 4자에서 12자까지 입력")
			pname.slect();
			pname.focus();
			return false;
		}
		//상품 가격 체크 - 숫자만 입력하세여
		if(unitPrice.value.length == 0 || isNaN(unitPrice.value)){
			alert("[가격]\n 숫자만 입력하세요")
			unitPrice.slect();
			unitPrice.focus();
			return false;
		}
		if(unitPrice.value.length < 0){
			alert("[가격]\n 음수는 입력할수 없습니다.")
			unitPrice.slect();
			return false;
		}
		
		
		//재고수 체크 - 숫자만
		
		if(unitsInStock.value.length == 0 || isNaN(unitsInStock.value)){
			alert("[재고 수]\n 숫자만 입력하세요")
			unitPrice.slect();
			unitPrice.focus();
			return false;
		}
		
		
		document.newProduct.submit();
	} 

</script>
</head>
<body>
   <fmt:setLocale value='<%=request.getParameter("language") %>'/>
   <fmt:bundle basename="bundle.message">
   <jsp:include page="./menu.jsp"/>
   <div class="jumbotron">
      <div class="container">
         <h1 class="display-3"><fmt:message key="title" /></h1>
      </div>
   </div>
   
   <div class="container">
   	<div class="text-right">
   		<a href="?language=ko">korean</a> | <a href="?language=en">English</a>
   		<a href="./logout.jsp" class="btn btn-sm btn-success pull-right">logout</a>
   	</div>
      <form action="./processAddProduct.jsp" method="post"
      		encType="multipart/form-data" name="newProduct">
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="productId" /></label>
            <div class="col-sm-3">
               <input type="text" name="productId" id="productId" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="pname" /></label>
            <div class="col-sm-3">
               <input type="text" name="pname" id="pname" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="unitPrice" /></label>
            <div class="col-sm-3">
               <input type="text" name="unitPrice" id="unitPrice" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="description" /></label>
            <div class="col-sm-5">
               <textarea rows="2" cols="50" name="description" class="form-control"></textarea>
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="title" /></label>
            <div class="col-sm-3">
               <input type="text" name="manufacturer" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="title" /></label>
            <div class="col-sm-3">
               <input type="text" name="category" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
            <label class="col-sm-2"><fmt:message key="manufacturer" /></label>
            <div class="col-sm-3">
               <input type="text" name="unitsInStock" id="unitsInStock" class="form-control>">
            </div>
         </div>
         <div class="form-group row">
				<label class="col-sm-2"></label>
				<div class="col-sm-5">
					<label><input type="radio" name="condition" value="New "> <fmt:message key="condition_New" /></label>
					<label><input type="radio" name="condition" value="Old "> <fmt:message key="condition_Old" /></label>
					<label><input type="radio" name="condition" value="Refurbished "> <fmt:message key="condition_Refurbished" /></label>
				</div>
			</div>
          <div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
         <div class="form-group row">
            <div class="col-sm-3">
               <input type="button" value="<fmt:message key="button" />"  class="btn btn-primary" onclick="checkAddProduct()">
            </div>
         </div>
         
      </form>
    </div>
    <jsp:include page="./footer.jsp"/>
</fmt:bundle>
</body>
</html>