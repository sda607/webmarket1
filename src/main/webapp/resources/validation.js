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