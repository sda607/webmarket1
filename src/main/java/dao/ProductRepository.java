package dao;

import java.util.ArrayList;

import vo.Product;

public class ProductRepository {

	private ArrayList<Product> listOfProducts = new ArrayList<>();
	
	//생성자
	public ProductRepository() {
		Product phone = new Product("P1234", "iphone 6s", 800000);
		phone.setDescription("4.7-inch 1334X750 Renia HD display 8-megapixel isSight Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Apple");
		phone.setUnitsInStock(1000);
		phone.setCondition("New");
		phone.setFilename("P1234.png");
		
		listOfProducts.add(phone);		//리스트에 phone을 추가
	}
	
	
	//목록 보기
	
	public ArrayList<Product> getAllProducts(){
		return listOfProducts;
	}
	
	
}













