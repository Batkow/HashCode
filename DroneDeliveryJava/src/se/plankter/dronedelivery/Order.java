package se.plankter.dronedelivery;

import java.util.HashMap;
import java.util.Map;

public class Order {
	
	private final int id;

	private final int deliveryPosX;
	private final int deliveryPosY;
	
	private Map<ProductType, Integer> productOrder = new HashMap<>();
	private Map<ProductType, Integer> yetToBeDelivered = new HashMap<>();
	
	public Order(int id, int deliveryPosX, int deliveryPosY) {
		this.id = id;
		this.deliveryPosX = deliveryPosX;
		this.deliveryPosY = deliveryPosY;
	}
	
	public boolean isFulfilled() {
		System.out.println("Order.isFulfilled() not yet implemented");
		// TODO implement
		return false;
	}
}
