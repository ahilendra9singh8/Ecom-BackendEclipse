package com.apogee.services;

import java.util.List;
import java.util.stream.Collectors;
import org.modelmapper.ModelMapper;
//import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.apogee.EntityModel.Category;
import com.apogee.Exception.ResourceNotFoundException;
import com.apogee.payload.CategoryDto;
import com.apogee.repository.CategoryRepository;

@Service
public class CategoryServiceImpl implements CategoryService {

//    @Configuration
//    public class AppConfig {
//
//        @Bean
//        public ModelMapper modelMapper() {
//            return new ModelMapper();
//        }
//    }

	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private ModelMapper mapper;

	@Override
	public CategoryDto createCategory(CategoryDto categoryDto) {
		CategoryDto categoryDto1 = null;
		try {
			// categoryDto to Category
			Category category = this.mapper.map(categoryDto, Category.class);
			Category c = this.categoryRepo.save(category);
			// product to productDto
			categoryDto1 = this.mapper.map(c, CategoryDto.class);
		} catch (Exception e) {
			System.out.println(e);
		}
		return categoryDto1;
	}

	@Override
	public CategoryDto updateCategory(CategoryDto categoryDto, int categoryId) {
		Category newCategory = this.mapper.map(categoryDto, Category.class);
		Category oldCategory = this.categoryRepo.findById(categoryId).orElseThrow(
				() -> new ResourceNotFoundException(+categoryId + "--from this categoryId category not found"));
		;
//        oldCategory.setCategoryId(newCategory.getCategoryId());
		oldCategory.setTitle(newCategory.getTitle());
		Category category = categoryRepo.save(oldCategory);
		CategoryDto c = this.mapper.map(category, CategoryDto.class);
		return c;
	}

	@Override
	public void deleteCategory(int categoryId) {
		categoryRepo.deleteById(categoryId);
	}

	@Override
	public CategoryDto getCategoryById(int categoryId) {
		Category getCategoryById = categoryRepo.findById(categoryId).orElseThrow(
				() -> new ResourceNotFoundException(+categoryId + "--from this productId product not found"));
		CategoryDto categorydto = this.mapper.map(getCategoryById, CategoryDto.class);
		return categorydto;
	}

	@Override
	public List<CategoryDto> getAllCategory() {
		List<CategoryDto> findAllDto = null;
		try {
			List<Category> viewAllCategory = categoryRepo.findAll();
			findAllDto = viewAllCategory.stream().map(category -> this.mapper.map(category, CategoryDto.class))
					.collect(Collectors.toList());

		} catch (Exception e) {
			System.out.println(e);
		}
		return findAllDto;
	}

}
