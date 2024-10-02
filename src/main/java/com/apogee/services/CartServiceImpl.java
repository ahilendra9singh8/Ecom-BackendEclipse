package com.apogee.services;

import java.util.Set;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.apogee.EntityModel.Cart;
import com.apogee.EntityModel.CartItem;
import com.apogee.EntityModel.Product;
import com.apogee.EntityModel.User;
import com.apogee.Exception.ResourceNotFoundException;
import com.apogee.payload.CartDto;
import com.apogee.payload.ItemRequest;
import com.apogee.repository.CartRepository;
import com.apogee.repository.ProductRepository;
import com.apogee.repository.UserRepository;

@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private UserRepository userRepo;
	@Autowired
	private ProductRepository productRepo;
	@Autowired
	private CartRepository cartRepo;
	@Autowired
	private ModelMapper modelMapper;

	@Override
	public CartDto addItem(ItemRequest item, String username) {
		Cart saveCart = null;
		try {
			int productId = item.getProductId();
			int quantity = item.getQuantity();
			// fetch user
			User user = this.userRepo.findByEmail(username)
					.orElseThrow(() -> new ResourceNotFoundException("User not found"));
			// fetch Product
			Product product = this.productRepo.findById(productId)
					.orElseThrow(() -> new ResourceNotFoundException("Product Not Found"));

			// here we are checking product stock
			if (!product.isStock()) {
				new ResourceNotFoundException("Product Out of Stock");
			}

			// create cartItem with productId and Qnt
			CartItem cartItem = new CartItem();
			cartItem.setProduct(product);
			cartItem.setQuantity(quantity);
			double totaleprice = product.getProduct_prize() * quantity;
			cartItem.setTotalprice(totaleprice);

			// getting cart from user
			Cart cart = user.getCart();

			if (cart == null) {
				cart = new Cart();
				//
				cart.setUser(user);
			}

			cartItem.setCart(cart);

			Set<CartItem> items = cart.getItems();

			// here we check item is available in CartItem or not
			// if CartItem is availabe then we inc Qnt only else
			// add new product in cartItem
			//
			// by default false
			AtomicReference<Boolean> flag = new AtomicReference<>(false);

			Set<CartItem> newproduct = items.stream().map((i) -> {
				if (i.getProduct().getProductId() == product.getProductId()) {
					i.setQuantity(quantity);
					i.setTotalprice(totaleprice);
					flag.set(true);
				}
				return i;

			}).collect(Collectors.toSet());

			if (flag.get()) {
				items.clear();
				items.addAll(newproduct);

			} else {
				cartItem.setCart(cart);
				items.add(cartItem);
			}

			saveCart = this.cartRepo.save(cart);
		} catch (Exception e) {
			System.out.println(e);
		}
		return this.modelMapper.map(saveCart, CartDto.class);
	}

	@Override
	public CartDto getcartAll(String email) {
		Cart cart = null;
		try {
			// find user
			User user = this.userRepo.findByEmail(email)
					.orElseThrow(() -> new ResourceNotFoundException("User Not Found"));
			// find cart
			cart = this.cartRepo.findByUser(user).orElseThrow(() -> new ResourceNotFoundException("There is no cart"));
		} catch (Exception e) {
			System.out.println(e);
		}
		return this.modelMapper.map(cart, CartDto.class);
	}

	// get cart by CartId
	@Override
	public CartDto getCartByID(int cartId) {
		Cart findByUserAndcartId = null;
		try {
			// User user=this.userRepo.findByEmail(username).orElseThrow(()->new
			// ResourceNotFoundException("User Not found"));
			findByUserAndcartId = this.cartRepo.findById(cartId)
					.orElseThrow(() -> new ResourceNotFoundException("Cart not Found"));
		} catch (Exception e) {
			System.out.println(e);
		}
		return this.modelMapper.map(findByUserAndcartId, CartDto.class);
	}

	@Override
	public CartDto removeCartItemFromCart(String userName, int ProductId) {
		Cart save = null;
		try {
			User user = this.userRepo.findByEmail(userName)
					.orElseThrow(() -> new ResourceNotFoundException("User Not found"));

			Cart cart = user.getCart();
			Set<CartItem> items = cart.getItems();

			boolean removeIf = items.removeIf((i) -> i.getProduct().getProductId() == ProductId);
			save = this.cartRepo.save(cart);
			System.out.println(removeIf);
		} catch (Exception e) {
			System.out.println(e);
		}
		return this.modelMapper.map(save, CartDto.class);
	}
}
