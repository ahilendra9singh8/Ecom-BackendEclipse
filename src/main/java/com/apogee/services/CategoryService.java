package com.apogee.services;

import com.apogee.payload.CategoryDto;
import java.util.List;

public interface CategoryService {

	public CategoryDto createCategory(CategoryDto categoryDto);

	public CategoryDto updateCategory(CategoryDto categoryDto, int categoryId);

	public void deleteCategory(int categoryId);

	public CategoryDto getCategoryById(int categoryId);

	public List<CategoryDto> getAllCategory();
}
