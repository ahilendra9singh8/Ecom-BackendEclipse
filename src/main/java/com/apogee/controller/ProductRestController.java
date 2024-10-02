package com.apogee.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import com.apogee.payload.AppConstants;
import com.apogee.payload.CategoryDto;
import com.apogee.payload.ProductDto;
import com.apogee.payload.ProductResponse;
import com.apogee.services.FileUploadService;
import com.apogee.services.ProductService;

@RestController
@RequestMapping("/product")
public class ProductRestController {

	@Autowired
	private ProductService productService;

	@Autowired
	private FileUploadService fileUploadService;

	@Value("${product.path.images}")
	private String imagepath;

//    http://localhost:8080/EcomBack/product/createProduct/1
//    {
//    "product_id":"1",
//    "product_name":"metroProduct2",
//    "product_prize":11,
//   "stock":true,
//   "product_quantity":2,
//    "live":true,
//   "product_imageName":"Default",
//    "product_desc":"good quality"
//}
//	@PostMapping("/createProduct/{catid}")
//	public ResponseEntity<ProductDto> createProduct(@RequestBody ProductDto productDto, @PathVariable int catid) {
//		ProductDto p = productService.createProduct(productDto, catid);
//		return new ResponseEntity<ProductDto>(p, HttpStatus.CREATED);
//	}

	@PostMapping("/createProduct")
	public ResponseEntity<ProductDto> createProduct(@RequestPart(value = "product_image") MultipartFile multipartFile,
			@RequestParam(value = "product_name") String product_name,
			@RequestParam(value = "product_prize") Double product_prize,
			@RequestParam(value = "product_quantity") int product_quantity,
			@RequestParam(value = "product_description") String product_description,
			@RequestParam(value = "product_category") int product_category,
			@RequestParam(value = "stock") boolean stock, @RequestParam(value = "product_live") boolean product_live) {
		ProductDto p = null;
		try {
			String uploadImage = this.fileUploadService.uploadImage(imagepath, multipartFile);

			ProductDto productDto = new ProductDto();
			productDto.setProduct_name(product_name);
			productDto.setProduct_prize(product_prize);
			productDto.setProduct_quantity(product_quantity);
			productDto.setProduct_desc(product_description);
			CategoryDto categoryDto = new CategoryDto();
			categoryDto.setCategoryId(product_category);
			productDto.setCategoryDto(categoryDto);
			productDto.setStock(stock);
			productDto.setLive(product_live);
			productDto.setProduct_imageName(uploadImage);
			p = productService.createProduct(productDto, product_category);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ResponseEntity<ProductDto>(p, HttpStatus.CREATED);
	}

//    http://localhost:8080/EcomBack/product/viewAllProduct?pageNumber=1&pageSize=2
	@GetMapping("/viewAllProduct")
	public ProductResponse viewAllProduct(
			@RequestParam(value = "pageNumber", defaultValue = AppConstants.PAGE_NUMBER_STRING, required = false) int pageNumber,
			@RequestParam(value = "pageSize", defaultValue = AppConstants.PAGE_SIZE_STRING, required = false) int pageSize,
			@RequestParam(value = "sortBy", defaultValue = AppConstants.SORT_BY_STRING, required = false) String sortBy,
			// @RequestParam(value = "sortBy", defaultValue = "product_id", required =
			// false) String sortBy,
			@RequestParam(value = "sortDir", defaultValue = AppConstants.SORT_DIR_STRING, required = false) String sortDir) {
		ProductResponse viewAllProduct = productService.viewAllProduct(pageNumber, pageSize, sortBy, sortDir);
		return viewAllProduct;
	}

//    http://localhost:8080/EcomBack/product/viewProductById/2
	@GetMapping("viewProductById/{productId}")
	public ResponseEntity<ProductDto> viewProductById(@PathVariable int productId) {
		ProductDto viewProductById = productService.viewProductById(productId);
		return new ResponseEntity<ProductDto>(viewProductById, HttpStatus.OK);
	}

//    http://localhost:8080/EcomBack/product/deleteProduct/2
	@DeleteMapping("deleteProduct/{productId}")
	public ResponseEntity<String> deleteProduct(@PathVariable int productId) {
		productService.deleteProduct(productId);
		return new ResponseEntity<String>("Product Deleted", HttpStatus.OK);
	}

//    http://localhost:8080/EcomBack/product/updateProduct/4
//    {
//   
//    "product_name":"updateProduct2",
//    "product_prize":10,
//   "stock":true,
//   "product_quantity":2,
//    "live":false,
//   "product_imageName":"Default",
//    "product_desc":"good quality"
//}
//	@PutMapping("updateProduct/{productId}")
//	public ResponseEntity<ProductDto> updateProduct(@PathVariable int productId, @RequestBody ProductDto productDto) {
//		ProductDto updatedProduct = productService.updateProduct(productId, productDto);
//		return new ResponseEntity<ProductDto>(updatedProduct, HttpStatus.ACCEPTED);
//	}

	@PutMapping("updateProduct/{productId}")
	public ResponseEntity<ProductDto> updateProduct(@PathVariable int productId,
			@RequestPart(value = "product_image") MultipartFile multipartFile,
			@RequestParam(value = "product_name") String product_name,
			@RequestParam(value = "product_prize") Double product_prize,
			@RequestParam(value = "product_quantity") int product_quantity,
			@RequestParam(value = "product_description") String product_description,
			@RequestParam(value = "product_category") int product_category,
			@RequestParam(value = "stock") boolean stock, @RequestParam(value = "product_live") boolean product_live) {
		ProductDto updatedProduct = null;
		try {
			String uploadImage = this.fileUploadService.uploadImage(imagepath, multipartFile);

			ProductDto productDto = new ProductDto();
			productDto.setProduct_name(product_name);
			productDto.setProduct_prize(product_prize);
			productDto.setProduct_quantity(product_quantity);
			productDto.setProduct_desc(product_description);
			CategoryDto categoryDto = new CategoryDto();
			categoryDto.setCategoryId(product_category);
			productDto.setCategoryDto(categoryDto);
			productDto.setStock(stock);
			productDto.setLive(product_live);
			productDto.setProduct_imageName(uploadImage);
			updatedProduct = productService.updateProduct(productId, productDto);
		} catch (Exception e) {
			System.out.println(e);
		}
		return new ResponseEntity<ProductDto>(updatedProduct, HttpStatus.ACCEPTED);
	}

//    http://localhost:8080/EcomBack/product/getProductbyCategory/1
	// Find product by Category wise....
	@GetMapping("getProductbyCategory/{categoryId}")
	public ResponseEntity<List<ProductDto>> getProductbyCategory(@PathVariable int categoryId) {
		List<ProductDto> findProductByCategory = this.productService.findProductByCategory(categoryId);
		return new ResponseEntity<List<ProductDto>>(findProductByCategory, HttpStatus.ACCEPTED);
	}

	// FileUpload
	@PostMapping("product/image/{productId}")
	public ResponseEntity<?> uploadImageOfProduct(@PathVariable int productId,
			@RequestParam("product_image") MultipartFile file) {

		ProductDto viewProductById = this.productService.viewProductById(productId);
		String imageName = null;
		ProductDto updatedProduct = null;
		try {
			String uploadImage = this.fileUploadService.uploadImage(imagepath, file);
//            viewProductById.setProduct_imageName(uploadImage);

			updatedProduct = productService.updateProduct(productId, viewProductById);
		} catch (Exception e) {
			e.printStackTrace();
//            return new ResponseEntity<>(Map.of("Message","File not upload"), HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(updatedProduct, HttpStatus.ACCEPTED);
	}
}
