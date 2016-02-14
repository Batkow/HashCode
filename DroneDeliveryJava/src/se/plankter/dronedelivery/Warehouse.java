package se.plankter.dronedelivery;

import java.util.HashMap;
import java.util.Map;

public class Warehouse {

	private final int id;
	private final int posX;
	private final int posY;
	
	private Map<ProductType, Integer> inventory = new HashMap<>();
	
	public Warehouse(int id, int posX, int posY) {
		this.id = id;
		this.posX = posX;
		this.posY = posY;
	}
	
	public int getId() {
		return id;
	}
	
	public int getPosX() {
		return posX;
	}
	
	public int getPosY() {
		return posY;
	}
	
	/**
	 * 
	 * @param drone
	 * @param productType
	 * @param amount
	 * @return false if action cannot be performed, true otherwise.
	 */
	public boolean loadToDrone(Drone drone, ProductType productType, int amount) {
		System.out.println("Warehouse.loadToDrone() not yet implemented");
		
		// TODO implement
		return false;
	}
	
	/**
	 * 
	 * @param drone
	 * @param productType
	 * @param amount
	 * @return false if action cannot be performed, true otherwise.
	 */
	public boolean unloadFromDrone(Drone drone, ProductType productType, int amount) {
		System.out.println("Warehouse.unloadFromDrone() not yet implemented");
		
		// TODO implement
		return false;
	}
}
